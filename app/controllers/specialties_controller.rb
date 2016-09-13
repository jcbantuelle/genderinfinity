class SpecialtiesController < ApplicationController

  def index
    @service = Service.find(params[:service_id])
    render partial: 'specialties'
  end

end
