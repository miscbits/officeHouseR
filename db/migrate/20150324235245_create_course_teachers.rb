class CreateCourseTeachers < ActiveRecord::Migration
  def change
    create_table :courses_teachers do |t|
      t.integer :course_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
