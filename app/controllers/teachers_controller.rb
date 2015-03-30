class TeachersController < ApplicationController

  before_action :logged_in_teacher, only: [:edit, :update, :destroy]
  before_action :correct_teacher,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def show
    current_teacher
    if params[:id].nil? && Teacher.find(params[:id]).nil?
      @teacher = Teacher.find(params[:id])
      @availabilities = @teacher.availabilities
    elsif logged_in?
      @teacher = @current_teacher
      @availabilities = @teacher.availabilities
    else
      @teacher = Teacher.new
      redirect_to '/login'
    end
  end

  def new
  	@teacher = Teacher.new
  end

  def avail
    @teacher = current_teacher
    @availability = Availability.new
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
    @teacher = Teacher.find current_teacher.id
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @teacher
    else
      render 'edit'
    end  
  end

  def destroy
    Teacher.find(params[:id]).destroy
    flash[:success] = "Teacher deleted"
    redirect_to teachers_url
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

  def admin_user
    redirect_to(root_url) unless current_teacher.admin?
  end


  private 
    def user_params
      params.require(:teacher).permit(:first_name, :last_name, :email, :password,
                                   :password_confirmation, :bio, :regular_hours)
    end

   
end
