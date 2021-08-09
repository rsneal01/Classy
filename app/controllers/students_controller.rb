class StudentsController < ApplicationController
    def index
        @students = Student.all
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
        end
        # binding.pry
    end

    def student_params
        params.require(:student).permit(:name, :schedule)
    end

end
