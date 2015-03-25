class AddIndexToTeachersEmail < ActiveRecord::Migration
  def change
    add_index :teachers, :email, unique: true
  end
end
