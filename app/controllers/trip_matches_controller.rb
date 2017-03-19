class TripMatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :retrieve_matches, only: :index

  def accept
    trip_match = TripMatch.find(params[:id])
    if current_user.id == trip_match.user_one_id
      trip_match.user_one_confirmed = true
    elsif current_user.id == trip_match.user_two_id
      trip_match.user_two_confirmed = true
    else
      flash[:alert] = 'Unauthorized'
      return redirect_to root_url
    end
    trip_match.save!
    flash[:notice] = "You have successfully accepted the match. If the other user also accepts, you will be able to see their email!"
    redirect_to get_matches_path
  end

  def index
    if @matches.size <= 0
      flash[:notice] = 'No Matches Found!'
    end
  end

  def retrieve_matches
    @matches = TripMatch.where(user_one_id: current_user.id).or TripMatch.where(user_two_id: current_user.id)
  end

end
