class Location < ActiveRecord::Base
  has_and_belongs_to_many :specialties

  validates :name, presence: true
  validates :address, presence: true

  scope :confirmed_by_gi, -> { where(confirmed_by_gi: true) }

  geocoded_by :address
  after_validation :geocode, if: ->(location) { location.address.present? and location.address_changed? }

  def specialty_names
    specialties.map(&:name)
  end
end
