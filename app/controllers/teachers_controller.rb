class TeachersController < ApplicationController

  def show
    @teacher = Teacher.find(params[:id])
  end

  def new
  	@teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(user_params) 
    if @teacher.save
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


  private 
    def user_params
      params.require(:teacher).permit(:first_name, :last_name, :email, :password,
                                   :password_confirmation)
    end

   
end
