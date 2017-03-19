class Trip < ApplicationRecord
  has_one :start_position_time
  has_one :end_position_time

  validates :vehicle_id, presence: true
  validates :distance, presence: true
  validates :fuel_efficiency, presence: true

end
