class TripsController < ApplicationController
  before_action :authenticate_user!

  def matches
    current_user.trips.each do |t|
      trips = t.match(t)
      if trips
        trips.each do |m|
          user_two_id = User.find(MojiVehicle.find(m.moji_vehicle_id).user_id).id
          unless current_user.id == user_two_id
            trip_match_forward = TripMatch.find_by(user_one_id: current_user.id, user_two_id: user_two_id)
            trip_match_backward = TripMatch.find_by(user_two_id: current_user.id, user_one_id: user_two_id)
            unless trip_match_forward || trip_match_backward
              TripMatch.create(user_one_id: current_user.id, user_two_id: user_two_id,
                              user_one_trip_id: t.id, user_two_trip_id: m.id)
            end
          end
        end
      end
    end
    redirect_to trip_matches_path
  end

end