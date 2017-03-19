class HomepageController < ApplicationController
  before_action :get_fuel_efficiency, :get_saved_money_and_distance, only: :stats

  def index
  end

  def nearby
  end

  def stats
  end

end


