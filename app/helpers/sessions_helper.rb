module SessionsHelper

	def log_in(teacher)
		session[:teacher_id] = teacher.id
	end

	def forget(teacher)
		teacher.forget
		cookies.delete(:teacher_id)
		cookies.delete(:remember_token)
	end

	def log_out
		forget(current_teacher)
		session.delete(:user_id)
		@current_teacher = nil
	end

	def current_teacher
	  @current_teacher ||= User.find_by(id: session[:user_id])
	end

	def logged_in?
    	!current_teacher.nil?
  	end


end
