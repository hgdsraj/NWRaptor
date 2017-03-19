class Trip < ApplicationRecord
  has_one :start_position_time, -> { distinct }
  has_one :end_position_time, -> { distinct }

  validates :distance, presence: true
  validates :fuel_efficiency, presence: true

end
