class SessionsController < ApplicationController

  def new
  end

  def create
    teacher = Teacher.find_by(email: params[:session][:email].downcase)
    if teacher && teacher.authenticate(params[:session][:password])
      log_in teacher
      params[:session][:remember_me] == '1' ? remember(teacher) : forget(teacher)
      redirect_to teacher
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end

