class LocationSearcher

  def initialize(search_form)
    @address = search_form.address
    @search_radius = search_form.search_radius
  end

  def search
    Location.near(@address, @search_radius).to_a
  end

end
