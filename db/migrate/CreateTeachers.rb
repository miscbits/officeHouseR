class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.integer :id
      t.string :first_name
      t.string :last_name
      t.integer :department_id
    end
  end
end