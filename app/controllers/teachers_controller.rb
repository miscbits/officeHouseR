class TeachersController < ApplicationController
	def new 
		@teacher = Teacher.new
	end

	def create
		@teacher = Teacher.new(params[:first_name, :last_name, :department_id])
		@teacher.save
	end

	def update

	end

	def show

	end

	def destroy 

	end

	# params.require(:teacher).permit(:first_name, :last_name)
end
