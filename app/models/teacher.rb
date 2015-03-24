class Teacher < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :department_id, :email, :password_digest, :bio
end
