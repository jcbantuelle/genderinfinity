class SearchController < ApplicationController

  def index
    if params[:zip_code]
      @locations = LocationSearcher.new(params[:zip_code]).search
    else
      render 'new'
    end
  end
end
