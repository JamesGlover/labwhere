# frozen_string_literal: true

FactoryBot.define do
  factory :location_types_restriction do
    location_type
    parentage_restriction
  end
end
