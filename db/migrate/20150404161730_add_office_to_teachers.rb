class AddOfficeToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :office, :string
  end
end
