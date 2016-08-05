class Specialty < ActiveRecord::Base
  has_and_belongs_to_many :locations
  has_and_belongs_to_many :services

  def self.default_scope
    includes(:services).order(:name)
  end

  def service_names
    services.map(&:name)
  end

  validates :name, presence: true
end
