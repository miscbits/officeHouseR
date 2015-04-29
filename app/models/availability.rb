class Availability < ActiveRecord::Base
  belongs_to :teacher
  validates :teacher_id, presence: true
  validates :meeting_time, presence: true, length: { maximum: 140 }
end
