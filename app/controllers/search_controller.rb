class SearchController < ApplicationController

  def index
    @specialties = Specialty.all
    @services = Service.all
    @search_form = SearchForm.new(params[:search_form])
    @service = Service.find(@search_form.service) if @search_form.service
    if @search_form.valid?
      @search = LocationSearcher.new(@search_form)
      @locations = @search.search
    else
      render 'new'
    end
  end

  def new
    @specialties = Specialty.all
    @services = Service.all
    @search_form = SearchForm.new(params)
  end

end
