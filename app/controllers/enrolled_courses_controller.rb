class EnrolledCoursesController < ApplicationController
    def new
        @enrolled_course = EnrolledCourse.new
        @student = Student.find(params[:student_id])

    end

    def create  
        course = Course.find_by(id: params[:course][:id])
        @student = Student.find(params[:student_id])
        @enrolled_course = EnrolledCourse.find_or_create_by(course_id: course.id, teacher_id: course.teacher.id, student_id: @student.id)
        if @enrolled_course.save
            @student.enrolled = true
            @student.save
            redirect_to student_path(@student)
        else
            render 'new'
        end
        # binding.pry
    end

    def show
    end

    def enrolled_course_params
        params.require(:enrolled_course).permit(:teacher_id, :course_id, :student_id)
    end

end
