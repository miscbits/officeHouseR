class RemovePasswordFromTeachers < ActiveRecord::Migration
  def up
    remove_column :teachers, :password
  end

  def down
    add_column :teachers, :password, :string
  end
end
