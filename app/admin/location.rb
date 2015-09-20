ActiveAdmin.register Location do
  permit_params :name, :phone, :contact, :address, :notes, specialty_ids: []

  index do
    selectable_column
    column :name
    column "Specialties" do |location|
      location.specialty_names.join(', ')
    end
    column :phone
    column :contact
    column :address
    column :notes
    actions
  end

  form do |f|
    fieldset class: 'inputs' do
      ol do
        f.input :name
        f.input :phone
        f.input :contact
        f.input :address
        f.input :notes
        f.input :specialties, as: :check_boxes, collection: Specialty.all
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row(:name)
      row(:specialties) do |location|
        location.specialty_names.join(', ')
      end
      row(:phone)
      row(:contact)
      row(:address)
      row(:notes)
    end
  end

  action_item :upload_csv do
    link_to 'Upload CSV', upload_csv_admin_locations_path
  end

  collection_action :upload_csv, method: :get do
  end

  collection_action :import_csv, method: :post do
    if params[:location_csv]
      if LocationImporter.new(params[:location_csv]).import
        return redirect_to collection_path, notice: 'Locations imported successfully!'
      else
        flash[:warning] = 'File failed to load'
      end
    else
      flash[:warning] = 'No file was uploaded'
    end
    render :upload_csv
  end
end
