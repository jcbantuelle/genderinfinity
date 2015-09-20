class Specialty < ActiveRecord::Base
  has_and_belongs_to_many :locations

  def self.default_scope
    order :name
  end

  validates :name, presence: true
end
