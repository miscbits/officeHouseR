class Availabilities < ActiveRecord::Base
  attr_accessible :meeting_time, :meeting_location, :teacher_id, :accepted
end
