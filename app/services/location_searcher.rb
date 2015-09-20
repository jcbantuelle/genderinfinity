class LocationSearcher

  attr_reader :address_coordinates

  def initialize(search_form)
    @address_coordinates = Geocoder.coordinates search_form.address
    @search_radius = search_form.search_radius
    @specialties = search_form.specialties
  end

  def search
    locations = Location.near(@address_coordinates, @search_radius).to_a
    locations = filter_by_specialties(locations) unless @specialties.empty?
    locations
  end

  private

  def filter_by_specialties(locations)
    locations.reject { |location|
      (location.specialties.map(&:id) & @specialties).empty?
    }
  end
end
