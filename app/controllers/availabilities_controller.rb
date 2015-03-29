class AvailabilitiesController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]

	def new
  	@availability = Availabilities.new
  end

  def create
    @availability = current_teacher.availabilities.build(availability_params) 
    if @availability.save
      flash[:success] = "Micropost created!"
      redirect_to teacher_path
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private 
    def availability_params
      params.require(:availability).permit(:meeting_time, :meeting_location)
    end

end
