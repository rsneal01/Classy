class StudentsController < ApplicationController
    def index
        @students = Student.all
        @unenrolled_students = Student.unenrolled
        @unenrolled_students_in_middle = Student.unenrolled_and_in_middle
        # @current_teacher_students = Student.enrolled_in_current_teacher
        # binding.pry
    end

    def new
        @student = Student.new
    end

    def create
        @student = Student.new(student_params)
        if @student.save
            redirect_to student_path(@student)
        else 
            render 'new'
        end
    end

    def show
        @student = Student.find(params[:id])
        @enrolled_courses = @student.enrolled_courses.map do |enrolled_course|
            Course.find_by(id: enrolled_course.course_id)
            # map to return array of courses from enrolled courses
        end
        # binding.pry
    end

    def student_params
        params.require(:student).permit(:name, :schedule, :grade)
    end

end
