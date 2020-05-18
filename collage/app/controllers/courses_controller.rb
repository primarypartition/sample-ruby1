class CoursesController < ApplicationController
  # GET /courses
  def index
   @courses = Course.all
  end
  
  # GET /courses/new
  def show
    @course = Course.find(params[:id])
  end
    
  # GET /courses/new
  def new
  
  end 
  
  # POST /course_enroll
  def enroll
    @course = Course.find(params[:course_id])
    
    if !current_user.courses.exists?(@course.id)
      current_user.courses << @course
      flash[:success] = "Student enroll successfully."
      
      redirect_to current_user
    else
      flash[:success] = "Something went wrong!"
      
      redirect_to root_path
    end
  end
end
