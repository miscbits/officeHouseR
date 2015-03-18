class AddFieldsToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :first_name, :string
    add_column :teachers, :last_name, :string
  end
end
