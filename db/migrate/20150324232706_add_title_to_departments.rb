class AddTitleToDepartments < ActiveRecord::Migration
  def change
    add_column :departments, :title, :string
  end
end
