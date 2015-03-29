class TeachersController < ApplicationController

  before_action :logged_in_teacher, only: [:edit, :update]
  before_action :correct_teacher,   only: [:edit, :update]
 
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

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end  
  end

  def destroy
  end

  def logged_in_teacher
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_teacher
    @teacher = Teacher.find(params[:id])
    redirect_to(root_url) unless current_teacher?(@teacher)  
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
