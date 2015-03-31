class AvailabilitiesController < ApplicationController

  before_action :logged_in_teacher, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

	def new
  	@availability = current_teacher.availability.new teacher: @teacher
  end

  def create
    @availability = current_teacher.availabilities.build(availability_params) 
    if @availability.save
      flash[:success] = "Availability created!"
      redirect_to current_teacher
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @availability.destroy
    flash[:success] = "Availability deleted"
    redirect_to current_teacher || root_url
  end

  private 
    def availability_params
      params.require(:availability).permit(:meeting_time, :meeting_location, :meeting_day)
    end

    def correct_user
      @availability = current_teacher.availabilities.find_by(id: params[:id])
      redirect_to root_url if @availability.nil?
    end

end
