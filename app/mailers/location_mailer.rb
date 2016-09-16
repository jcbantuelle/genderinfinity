class LocationMailer < ApplicationMailer

  def new_submission(location)
    @location = location
    mail to: 'info@genderinfinity.org', subject: 'New GI MAP Location Submission'
  end
end
