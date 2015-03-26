module SessionsHelper

	def log_in(teacher)
		session[:teacher_id] = teacher.id
	end

end
