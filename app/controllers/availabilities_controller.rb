class AvailabilitiesController < ApplicationController
	def new
  	@availability = Availabilities.new
  end

  def create
    @availability = Availabilities.new(availability_params) 
    if @availability.save
      redirect_to teacher_path
    else
      render 'new'
    end
  end

  private 
    def availability_params
      params.require(:availability).permit(:meeting_time, :meeting_location)
    end

end
