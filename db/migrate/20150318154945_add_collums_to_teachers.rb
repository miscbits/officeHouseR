class AddCollumsToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :department_id, :integer
  end
end
