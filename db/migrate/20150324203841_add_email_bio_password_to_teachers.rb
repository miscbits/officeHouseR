class AddEmailBioPasswordToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :email, :string
    add_column :teachers, :bio, :string
    add_column :teachers, :password, :string
  end
end
