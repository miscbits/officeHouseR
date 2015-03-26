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

end
