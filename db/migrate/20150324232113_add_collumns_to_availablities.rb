class AddCollumnsToAvailablities < ActiveRecord::Migration
  def change
    add_column :availabilities, :meeting_time, :datetime
    add_column :availabilities, :meeting_location, :string
    add_column :availabilities, :teacher_id, :integer
    add_column :availabilities, :accepted, :boolean
  end
end
