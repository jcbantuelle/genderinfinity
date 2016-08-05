class SearchController < ApplicationController

  def index
    @specialties = Specialty.all
    @services = Service.all
    @search_form = SearchForm.new(params[:search_form])
    @service_specialties = Service.find(@search_form.service).specialties if @search_form.service
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

  def specialties
    @service_specialties = Service.find(params[:service_id]).specialties
    render partial: 'specialties'
  end
end
