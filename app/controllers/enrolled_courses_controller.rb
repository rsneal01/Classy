class EnrolledCoursesController < ApplicationController
    def new
        @enrolled_course = EnrolledCourse.new
        @student = Student.find(params[:student_id])

    end

    def create
        
    end

    def show
    end

    def enrolled_course_params
        params.require(:enrolled_course).permit(:teacher_id, :course_id, :student_id)
    end

end
