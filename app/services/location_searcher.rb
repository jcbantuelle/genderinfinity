class LocationSearcher

  attr_reader :address_coordinates

  def initialize(search_form)
    @address_coordinates = Geocoder.coordinates search_form.address
    @search_radius = search_form.search_radius
  end

  def search
    Location.near(@address_coordinates, @search_radius).to_a
  end

end
