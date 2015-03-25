class Teacher < ActiveRecord::Base

  before_save { self.email = email.downcase }	

  attr_accessible :first_name, :last_name, :department_id, :email, :password_digest, :bio

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: //\A[\w+\-.]+@wcupa\.edu/ }, uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password_digest, length: { minimum: 6 }

end
