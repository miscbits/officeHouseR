class CreateAvailabilityTeachers < ActiveRecord::Migration
  def change
    create_table :availability_teachers do |t|
      t.integer :availability_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
