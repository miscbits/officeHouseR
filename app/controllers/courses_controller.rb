class CoursesController < ApplicationController

  def new
  	@course = Courses.new
  end

  def create
    @course = current_teacher.courses.build(course_params) 
    if @course.save
      flash[:success] = "Class Added"
      redirect_to "/course/new"
    else
      flash[:danger] = "Adding class failed. Please try again in a few moments"
      redirect_to "/course/new"
    end
  end

  private 
    def course_params
      params.require(:course).permit(:course_id, :description)
    end


end
