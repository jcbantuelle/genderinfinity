class AddConfirmedByGiToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :confirmed_by_gi, :bool
  end
end
