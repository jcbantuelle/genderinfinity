class Service < ActiveRecord::Base
  has_and_belongs_to_many :specialties

  validates :name, presence: true
end
