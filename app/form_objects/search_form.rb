class SearchForm
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :address, :search_radius, :specialties, :service

  validates :address, presence: true
  validates :service, presence: true
  validates :search_radius, numericality: { only_integer: true }

  def initialize(params)
    @address = params[:address]
    @search_radius = params[:search_radius]
    @service = params[:service]
    @specialties = formatted_specialties(params[:specialties])
  end

  private

  def formatted_specialties(specialties)
    if specialties.nil?
      []
    else
      specialties.reject(&:empty?).map(&:to_i)
    end
  end
end
