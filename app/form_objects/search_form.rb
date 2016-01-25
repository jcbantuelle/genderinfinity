class SearchForm
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :address, :search_radius, :specialties, :confirmed_by_gi

  validates :address, presence: true
  validates :search_radius, numericality: { only_integer: true }

  def initialize(params)
    @address = params[:address]
    @search_radius = params[:search_radius]
    @specialties = formatted_specialties(params[:specialties])
    @confirmed_by_gi = params[:confirmed_by_gi]
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
