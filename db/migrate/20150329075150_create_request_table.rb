class CreateRequestTable < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :name
      t.string :email
      t.string :message
      t.integer :availability_id
    end
  end
end
