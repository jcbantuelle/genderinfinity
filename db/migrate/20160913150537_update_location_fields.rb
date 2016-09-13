class UpdateLocationFields < ActiveRecord::Migration
  def change
    rename_column :locations, :contact, :website
    add_column :locations, :fax, :string
    add_column :locations, :email, :string
    add_column :locations, :approved, :boolean
  end
end
