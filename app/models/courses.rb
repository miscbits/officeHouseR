class Courses < ActiveRecord::Base

  before_save { self.course_id = course_id.upcase }	
  has_and_belongs_to_many :teachers


end
