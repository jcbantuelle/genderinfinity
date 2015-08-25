class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :phone
      t.string :contact
      t.string :address
      t.string :notes

      t.timestamps null: false
    end
  end
end
