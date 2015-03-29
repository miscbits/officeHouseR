class AddRememberTokenToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :remember_token, :string
  end
end
