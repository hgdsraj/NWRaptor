class PositionTime < ApplicationRecord
  SUPPORTED_TYPES = %w(StartPositionTime EndPositionTime)

  validates :latitude, presence: true
  validates :longitude,  presence: true
  validates :time, presence: true
  validates :type, presence: true, inclusion: { in: SUPPORTED_TYPES, message: "not a valid type" }


end
