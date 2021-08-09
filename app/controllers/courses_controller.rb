class CoursesController < ApplicationController

    def index
        if params[:teacher_id]
            @courses = Teacher.find(params[:teacher_id]).courses
        else
            @courses = Course.all
        end
    end

    def new
        @teacher = current_user
        @course = Course.new
    end

    def create
        # binding.pry
        @course = Course.new(course_params)
        if @course.save
            redirect_to course_path(@course)
        else 
            render 'new'
        end
    end
    
    def show
        @teacher = current_user
        @course = Course.find_by(id: params[:id])
        # logic to check if current user owns this course; if yes can edit course if no cannot edit
    end

    def edit
        @course = Course.find_by(id: params[:id])
    end

    def update
        course = Course.find_by(id: params[:id])
        course.update(course_params)
        redirect_to course_path(course)
    end

    def course_params
        params.require(:course).permit(:title, :time, :description, :teacher_id)
    end


end
