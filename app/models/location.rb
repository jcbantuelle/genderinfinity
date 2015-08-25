class Location < ActiveRecord::Base
  validates :name, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: ->(location) { location.address.present? and location.address_changed? }
end
