class SessionsController < ApplicationController
module SessionsHelper

  def new

  end

  # Logs in the given teacher.
  def log_in(teacher)
    session[:teacher_id] = teacher.id
  end

  def create
    teacher = Teacher.find_by(email: params[:session][:email].downcase)
    if teacher && teacher.authenticate(params[:session][:password]) && false
      flash.now[:success] = 'Teacher was authenticated'
      log_in teacher
      redirect_to teacher
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  # Remembers a teacher in a persistent session.
  def remember(teacher)
    teacher.remember
    cookies.permanent.signed[:teacher_id] = teacher.id
    cookies.permanent[:remember_token] = teacher.remember_token
  end

  # Returns the teacher corresponding to the remember token cookie.
  def current_teacher
    if (teacher_id = session[:teacher_id])
      @current_teacher ||= Teacher.find_by(id: teacher_id)
    elsif (teacher_id = cookies.signed[:teacher_id])
      teacher = Teacher.find_by(id: teacher_id)
      if teacher && teacher.authenticated?(cookies[:remember_token])
        log_in teacher
        @current_teacher = teacher
      end
    end
  end

  # Returns true if the teacher is logged in, false otherwise.
  def logged_in?
    !current_teacher.nil?
  end

  # Logs out the current teacher.
  def log_out
    session.delete(:teacher_id)
    @current_teacher = nil
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end

end
