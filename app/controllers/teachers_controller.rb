class TeachersController < ApplicationController

  def show
    current_teacher
    if params[:id] != nil
      @teacher = Teacher.find(params[:id])
    elsif @current_teacher != nil
      @teacher = @current_teacher
    else
      @teacher = Teacher.new
      redirect_to '/login'
    end
  end

  def new
  	@teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(user_params) 
    if @teacher.save
      log_in @teacher
      redirect_to @teacher
    else
      render 'new'
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def destroy
  end

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



  private 
    def user_params
      params.require(:teacher).permit(:first_name, :last_name, :email, :password,
                                   :password_confirmation)
    end

   
end
