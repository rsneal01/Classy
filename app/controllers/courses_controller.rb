class CoursesController < ApplicationController
    def new
        @course = Course.new
    end

    def create
        
    end

    def course_params
        params.require(:course).permit(:title, :time, :description)
    end


end
