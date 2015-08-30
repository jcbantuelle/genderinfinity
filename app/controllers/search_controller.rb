class SearchController < ApplicationController

  def index
    @search_form = SearchForm.new(params[:search_form])
    if @search_form.valid?
      @locations = LocationSearcher.new(@search_form).search
    else
      render 'new'
    end
  end

  def new
    @search_form = SearchForm.new(params)
  end
end
