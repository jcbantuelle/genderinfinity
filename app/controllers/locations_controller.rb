class LocationsController < ApplicationController

  def new
    @services = Service.all
    @location_form = LocationForm.new(params)
  end

  def create
    @services = Service.all
    @location_form = LocationForm.new(params[:location_form])
    @service = Service.find(@location_form.service) if @location_form.service
    if @location_form.save
      redirect_to action: 'thank_you'
    else
      render 'new'
    end
  end

  def thank_you
  end
end
