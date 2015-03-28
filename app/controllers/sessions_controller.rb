class SessionsController < ApplicationController

  def new
  end

  def create
    teacher = Teacher.authenticate(params[:session][:email],
                             params[:session][:password])
    if teacher.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      sign_in teacher
      redirect_to teacher
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end