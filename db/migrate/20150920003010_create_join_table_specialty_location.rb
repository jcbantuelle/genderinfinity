class CreateJoinTableSpecialtyLocation < ActiveRecord::Migration
  def change
    create_join_table :specialties, :locations do |t|
      # t.index [:specialty_id, :location_id]
      # t.index [:location_id, :specialty_id]
    end
  end
end
