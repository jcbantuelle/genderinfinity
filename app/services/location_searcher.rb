class LocationSearcher

  attr_reader :address_coordinates

  def initialize(search_form)
    @address_coordinates = Geocoder.coordinates search_form.address
    @search_radius = search_form.search_radius
    @specialties = search_form.specialties
    @service = search_form.service
    # @confirmed_by_gi = search_form.confirmed_by_gi
  end

  def search
    locations = Location.near(@address_coordinates, @search_radius)
    # locations = locations.confirmed_by_gi if @confirmed_by_gi
    locations = locations.to_a
    if (@specialties.empty?)
      locations = filter_by_service(locations)
    else
      locations = filter_by_specialties(locations) unless @specialties.empty?
    end
    locations
  end

  private

  def filter_by_specialties(locations)
    locations.reject { |location|
      (location.specialties.map(&:id) & @specialties).empty?
    }
  end

  def filter_by_service(locations)
    locations.select { |location|
      location.service_ids.include?(@service)
    }
  end
end
