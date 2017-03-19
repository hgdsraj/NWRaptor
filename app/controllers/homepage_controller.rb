class HomepageController < ApplicationController
  before_action :get_fuel_efficiency, :get_saved_money_and_distance, only: :stats
  def index
  end
  def nearby
  end
  def stats
  end

  private

  #   These following functions depends on user who logged in

  def get_fuel_efficiency
    vehicles = current_user.moji_vehicles
    size = vehicles.size
    @fuel = 0
    vehicles.each do |v|
      @fuel += v.fuel_efficiency
    end
    @fuel /= size
  end

  def get_saved_money_and_distance
    total_distance = 0
    current_user.moji_vehicles.each do |v|
      v.trips.each do |t|
        if  ((1.week.ago)..(Time.now)).include?((t.start_position_time.time))
          total_distance += t.distance
        end
      end
    end
    @distance = total_distance / 1000
    @money = (@distance / @fuel) * 1.30
  end

  def nearby
  end

  def stats
  end

end


