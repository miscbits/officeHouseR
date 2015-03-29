class RequestsController < ApplicationController

	def new
  	@request = Requests.new
  end

  def create
    @request = Requests.new(request_params) 
    if @request.save
      redirect_to teacher_path
    else
      render 'new'
    end
  end

  private 
    def request_params
      params.require(:request).permit(:meeting_time, :meeting_location)
    end

end
