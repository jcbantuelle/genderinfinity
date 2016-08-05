class CreateJoinTableServiceSpecialty < ActiveRecord::Migration
  def change
    create_join_table :services, :specialties do |t|
      # t.index [:service_id, :specialty_id]
      # t.index [:specialty_id, :service_id]
    end
  end
end
