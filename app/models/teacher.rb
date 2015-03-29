class Teacher < ActiveRecord::Base
  include Clearance::User

  before_save { self.email = email.downcase}	

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@wcupa\.edu/ }, uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password_digest, length: { minimum: 6 }, allow_blank: true

  def Teacher.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def Teacher.new_token
	  SecureRandom.urlsafe_base64  	
  end

  def remember
  	self.remember_token = Teacher.new_token
  	update_attribute(:remember_digest, Teacher.digest(remember_token))  	
  end

  def authenticated?(remember_token)
  	return false if remember_digest.nil?
  	BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

   def forget
    update_attribute(:remember_digest, nil)
  end


end
