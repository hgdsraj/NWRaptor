class HomepageController < ApplicationController
  def index
  end
  def nearby
  end
  def stats
	  get_fuel_efficiency
  end

  private


  #   These following functions depends on user who logged in

  def get_fuel_efficiency
  end

  def get_saved_money

  end

  def distance_traveled_this_week

  end

  def emissions

  end

end


