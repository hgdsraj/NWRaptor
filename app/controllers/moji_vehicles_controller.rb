require 'uri'
require 'net/http'
require 'json'

class MojiVehiclesController < ApplicationController
  before_action :authenticate_user!

  def add_vehicles

    course_uri = URI.encode("https://api.moj.io/v2/trips")

    uri = URI.parse(course_uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(uri.request_uri)
    request['Authorization'] = 'Bearer ' + current_user.api_key

    response = http.request(request)

# Get specific header

    json_response = JSON.parse(response.body)

    json_response['Data'].each do |response|
      ActiveRecord::Base.transaction do
        unless StartPositionTime.find_by(time: Time.parse(response['StartTimestamp']))
          @vehicle = MojiVehicle.find_by(moji_vehicle_id: response['VehicleId']) || MojiVehicle.create!(moji_vehicle_id: response['VehicleId'])
          distance = response['EndOdometer']['Value']
          gas_used = distance/response['FuelEfficiency']['BaseValue']/1000
          @trip = Trip.create!(moji_vehicle_id: @vehicle.id, fuel_efficiency: response['FuelEfficiency']['BaseValue'], distance: distance, gas_used: gas_used)
          @start_position = StartPositionTime.create!(trip_id: @trip.id, latitude: response['StartLocation']['Lat'], longitude: response['StartLocation']['Lng'], time: Time.parse(response['StartTimestamp']))
          @end_position = EndPositionTime.create!(trip_id: @trip.id, latitude: response['EndLocation']['Lat'], longitude: response['EndLocation']['Lng'], time: Time.parse(start_timestamp = response['EndTimestamp']))
          handle_after_actions
        end
      end
    end

    flash[:notice] = "Success, vehicles imported"
    redirect_to root_url

  rescue => e
    flash[:alert] = e
    redirect_to root_url
  end

  def handle_after_actions
    @trip.start_position_time = @start_position
    @trip.end_position_time = @end_position
    @vehicle.trips << @trip
    current_user.moji_vehicles << @vehicle
  end
end