class CoursesController < ApplicationController
    def new
        
        @teacher = current_user
        @course = Course.new
    end

    def create
        binding.pry
        @course = Course.create(course_params)
        redirect_to course_path(@course)
    end
    
    def show
        @course = Course.find_by(id: params[:id])
        # logic to check if current user owns this course; if yes can edit course if no cannot edit
    end

    def course_params
        params.require(:course).permit(:title, :time, :description, :teacher_id)
    end


end
