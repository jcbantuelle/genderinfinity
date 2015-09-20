class SearchForm
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :address, :search_radius, :specialties

  validates :address, presence: true
  validates :search_radius, numericality: { only_integer: true }

  def initialize(params)
    @address = params[:address]
    @search_radius = params[:search_radius]
    @specialties = params[:specialties].reject(&:empty?).map(&:to_i)
  end

end
