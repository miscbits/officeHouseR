class Course < ActiveRecord::Base

  before_save { self.course_id = course_id.upcase }	
  validates :course_id, format: { with: /[a-zA-z][a-zA-z][a-zA-z] [0-9][0-9][0-9]/ }, uniqueness: { case_sensitive: false }

  belongs_to :teacher


end
