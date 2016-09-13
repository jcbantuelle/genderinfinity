class LocationForm
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :address, :phone, :fax, :email, :website, :notes, :specialties, :service

  validates :name, presence: true
  validates :address, presence: true
  validates :service, presence: true
  validates :specialties, presence: true

  def initialize(params)
    @name = params[:name]
    @address = params[:address]
    @phone = params[:phone]
    @fax = params[:fax]
    @email = params[:email]
    @website = params[:website]
    @notes = params[:notes]
    @service = params[:service]
    @specialties = formatted_specialties(params[:specialties])
  end

  def persisted?
    false
  end

  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

private

  def persist!
    @location = Location.create!(name: name, address: address, phone: @phone, fax: @fax, email: @email, website: @website, notes: @notes, specialty_ids: @specialties, approved: false)
  end

  def formatted_specialties(specialties)
    if specialties.nil?
      []
    else
      specialties.reject(&:empty?).map(&:to_i)
    end
  end
end
