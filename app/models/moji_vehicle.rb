class MojiVehicle < ApplicationRecord

  has_many :trips, -> { distinct }

  validates :user_id, presence: true
  validates :moji_vehicle_id, presence: true
  validates :fuel_efficiency, presence: true

end
