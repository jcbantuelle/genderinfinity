class Location < ActiveRecord::Base
  has_and_belongs_to_many :specialties

  validates :name, presence: true
  validates :address, presence: true

  def self.default_scope
    includes(:specialties)
  end
  scope :approved, -> { where(approved: true) }
  scope :unapproved, -> { where(approved: false) }

  geocoded_by :address
  after_validation :geocode, if: ->(location) { location.address.present? and location.address_changed? }

  def specialty_names
    specialties.map(&:name)
  end

  def service_ids
    specialties.flat_map(&:services).map(&:id).uniq
  end

end
