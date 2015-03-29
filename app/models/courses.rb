class Courses < ActiveRecord::Base

  before_save { self.course_id = course_id.upcase }	

end
