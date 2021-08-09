class EnrolledCoursesController < ApplicationController
    def new
        @enrolled_course = EnrolledCourse.new
        @student = Student.find(params[:student_id])

    end

    def create  
        course = Course.find_by(id: params[:course][:id])
        @enrolled_course = EnrolledCourse.new(course_id: course.id, teacher_id: course.teacher.id, student_id: params[:student_id])
        # binding.pry
    end

    def show
    end

    def enrolled_course_params
        params.require(:enrolled_course).permit(:teacher_id, :course_id, :student_id)
    end

end
