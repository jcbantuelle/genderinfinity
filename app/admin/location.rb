ActiveAdmin.register Location do
  permit_params :name, :phone, :contact, :address, :notes

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
