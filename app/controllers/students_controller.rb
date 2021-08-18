class StudentsController < ApplicationController
    def index
        @students = Student.all
        @enrolled_students = Student.enrolled
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
        params.require(:student).permit(:name, :schedule)
    end

end
