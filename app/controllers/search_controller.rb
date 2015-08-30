class SearchController < ApplicationController

  def index
    @locations = LocationSearcher.new(params).search
  end
end
