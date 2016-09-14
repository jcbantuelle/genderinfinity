ActiveAdmin.register Location, as: 'Unapproved Location' do

  menu label: 'Unapproved Locations'

  controller do
    def scoped_collection
      end_of_association_chain.unapproved
    end
  end

  member_action :approve, method: :get do
    resource.update!(approved: true)
    redirect_to admin_unapproved_locations_path
  end

  action_item only: :show do
    link_to 'Approve', approve_admin_unapproved_location_path(unapproved_location)
  end

  permit_params :name, :phone, :fax, :email, :website, :address, :notes, specialty_ids: []

  index do
    selectable_column
    column :name
    column :address
    column :phone
    column :fax
    column :email
    column :website
    column :notes
    column "Specialties" do |location|
      location.specialty_names.join(', ')
    end
    actions defaults: true do |unapproved_location|
      link_to 'Approve', approve_admin_unapproved_location_path(unapproved_location)
    end
  end

  form do |f|
    fieldset class: 'inputs' do
      ol do
        f.input :name
        f.input :address
        f.input :phone
        f.input :fax
        f.input :email
        f.input :website
        f.input :notes
        f.input :specialties, as: :check_boxes, collection: Specialty.all
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row(:name)
      row(:address)
      row(:phone)
      row(:fax)
      row(:email)
      row(:website)
      row(:notes)
      row(:specialties) do |location|
        location.specialty_names.join(', ')
      end
    end
  end

end
