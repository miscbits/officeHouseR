class AvailabilitiesController < ApplicationController

  before_action :logged_in_teacher, only: [:create, :destroy]

	def new
  	@availability = current_teacher.availability.new teacher: @teacher
  end

  def create
    @availability = current_teacher.availabilities.build(availability_params) 
    if @availability.save
      flash[:success] = "Micropost created!"
      redirect_to current_teacher
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private 
    def availability_params
      params.require(:availability).permit(:meeting_time, :meeting_location, :meeting_day)
    end

end
