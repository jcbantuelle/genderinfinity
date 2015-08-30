class LocationSearcher

  def initialize(params)
    @address = params[:address]
    @search_radius = params[:search_radius]
  end

  def search
    Location.near(@address, @search_radius).to_a
  end

end
