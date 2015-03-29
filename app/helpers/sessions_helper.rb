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
		session.delete(:teacher_id)
		@current_teacher = nil
	end

  def current_teacher
    if (teacher_id = session[:teacher_id])
      @current_teacher ||= Teacher.find_by(id: teacher_id)
    elsif (teacher_id = cookies.signed[:teacher_id])
      teacher = Teacher.find_by(id: teacher_id)
      if teacher && Teacher.authenticated?(cookies[:remember_token])
        log_in teacher
        @current_teacher = teacher
      end
    end
  end

  def current_teacher?(teacher)
    teacher == current_teacher
  end

  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  def store_location
    session[:forwarding_url] = request.url if request.get?
  end

	def logged_in?
    	!current_teacher.nil?
  	end

	def remember(teacher)
    	teacher.remember
    	cookies.permanent.signed[:teacher_id] = teacher.id
    	cookies.permanent[:remember_token] = teacher.remember_token
  end


end