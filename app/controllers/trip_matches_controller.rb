class TripMatchesController < ApplicationController
  before_action :authenticate_user

  def accept
    # mid = match.id
    if match == match.user_one_id
      match.user_one_confirmed << true
    end
    if match == match.user_two_id
      match.user_two_confirmed << true
    end
  end
end
