class Event

  include ActiveModel::Model

  attr_accessor :user, :labware, :action

  validates_presence_of :user, :labware, :action

  validate :check_location_exists

  delegate :coordinate, to: :labware, allow_nil: true
  delegate :location, to: :labware

  def as_json(*)
    {
      location_barcode: location.barcode,
      location_name: location.name,
      parentage: location.parentage,
      labware_barcode: labware.barcode,
      action: action,
      user_login: user.login,
      coordinate: coordinate.try(:position)
    }
  end

  private

  def check_location_exists
    return unless labware.present?
    return if location.present?
    errors.add(:location, 'must be present')
  end

end