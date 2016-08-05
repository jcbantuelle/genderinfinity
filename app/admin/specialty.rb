ActiveAdmin.register Specialty do
  permit_params :name, service_ids: []

  index do
    selectable_column
    column :name
    column "Services" do |specialty|
      specialty.service_names.join(', ')
    end
    actions
  end

  form do |f|
    fieldset class: 'inputs' do
      ol do
        f.input :name
        f.input :services, as: :check_boxes, collection: Service.all
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row(:name)
      row(:services) do |specialty|
        specialty.service_names.join(', ')
      end
    end
  end
end
