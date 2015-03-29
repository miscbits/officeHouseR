class AddRegularHoursToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :regular_hours, :string
  end
end
