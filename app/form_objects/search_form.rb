class SearchForm
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :address, :search_radius

  validates :address, presence: true
  validates :search_radius, numericality: { only_integer: true }

  def initialize(params)
    @address = params[:address]
    @search_radius = params[:search_radius]
  end

end
