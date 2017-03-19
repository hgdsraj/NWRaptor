class Trip < ApplicationRecord
  has_one :start_position_time, -> { distinct }
  has_one :end_position_time, -> { distinct }

  validates :distance, presence: true
  validates :fuel_efficiency, presence: true

  def match(trip)
    matches = []
    Trip.where.not(id: trip.id).each do |t|
      if run_comparison(t.start_position_time, trip.start_position_time) && run_comparison(t.end_position_time, trip.end_position_time)
        matches << t
      end
    end
    matches
  end

  def run_comparison(a, b)
    compare(a.latitude, b.latitude) && compare(a.longitude, b.longitude)
  end

  def compare(a, b)
    (a-b).abs <= 0.5
  end

end
