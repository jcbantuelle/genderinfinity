class LocationSearcher

  SEARCH_DISTANCE = 2

  def initialize(zip_code)
    @zip_code = zip_code
  end

  def search
    Location.near(@zip_code, SEARCH_DISTANCE).to_a
  end

end
