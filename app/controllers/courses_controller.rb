class CoursesController < ApplicationController

  def new
  	@course = Courses.new
  end

  def create
    @course = Courses.new(course_params) 
    if @course.save
      redirect_to teacher_path
    else
      render 'new'
    end
  end

  private 
    def course_params
      params.require(:course).permit(:course_id)
    end


end
