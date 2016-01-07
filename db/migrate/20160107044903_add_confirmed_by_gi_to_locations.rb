class AddConfirmedByGiToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :confirmed_by_gi, :bool, :null => false, :default => false
  end
end
