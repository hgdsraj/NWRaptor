class MojiVehicle < ApplicationRecord

  has_many :trips, -> { distinct }

  validates :moji_vehicle_id, presence: true

end
