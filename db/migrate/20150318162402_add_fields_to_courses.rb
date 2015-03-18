class AddFieldsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :course_id, :string
    add_column :courses, :description, :string
  end
end
