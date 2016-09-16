class SpecialtiesController < ApplicationController

  def index
    @service = Service.find(params[:service_id])
    render partial: 'specialties', locals: {form_type: params[:form_type], selected_specialties: nil}
  end

end
