class AddRememberDigestToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :remember_digest, :string
  end
end
