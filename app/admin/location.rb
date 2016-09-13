ActiveAdmin.register Location do
  permit_params :name, :phone, :fax, :email, :website, :address, :notes, :confirmed_by_gi, specialty_ids: []

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
    actions
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
