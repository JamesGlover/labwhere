# frozen_string_literal: true

##
# Serializer for the Labware
class LabwareLiteSerializer < ActiveModel::V08::Serializer
  attributes :barcode, :location_barcode

  def location_barcode
    return if object.location.empty?

    object.location.barcode
  end
end
