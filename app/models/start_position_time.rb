class StartPositionTime < PositionTime
  SUPPORTED_TYPE = %w(StartPositionTime)

  validates :type, presence: true, inclusion: { in: SUPPORTED_TYPES, message: "not a valid type" }

end
