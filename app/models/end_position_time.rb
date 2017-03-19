class EndPositionTime < PositionTime
  SUPPORTED_TYPE = %w(EndPositionTime)

  validates :type, presence: true, inclusion: { in: SUPPORTED_TYPES, message: "not a valid type" }

end
