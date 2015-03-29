class AddMeetingDayToAvailabilities < ActiveRecord::Migration
  def change
    add_column :availabilities, :meeting_day, :datetime
  end
end
