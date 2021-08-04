class TeachersController < ApplicationController
    def new
        @teacher = Teacher.new
    end

    def create
        @teacher = Teacher.new(teacher_params)
        if @teacher.save
            session[:teacher_id] = @teacher.id
            redirect_to teacher_path(@teacher)
        else
            render 'new'
        end
    end

    def show
        # binding.pry
        @teacher = Teacher.find(params[:id])
    end

    def teacher_params
        params.require(:teacher).permit(:name, :password)
    end

end
