class Location < ActiveRecord::Base
  has_and_belongs_to_many :specialties

  validates :name, presence: true
  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: ->(location) { location.address.present? and location.address_changed? }
end
