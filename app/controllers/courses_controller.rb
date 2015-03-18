class CoursesController < ApplicationController
	def new 
		@course = Course.new
	end

	def create
		@course = Course.new(params[:description, :course_id])
		@course.save
	end

	def update

	end

	def show

	end

	def destroy 

	end
end
