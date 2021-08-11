class SessionController < ApplicationController
    def new
        @teacher = Teacher.new
    end

    def create
        # binding.pry
        if @teacher = Teacher.find_by(name: params[:name])
        # @teacher = Teacher.find_by(name: params[:name])
        # if @teacher && @teacher.authenticate(params[:password])
            session[:teacher_id] = @teacher.id
            redirect_to teacher_path(@teacher)
        else
            render 'new'
        end
    end

    def destroy
        session[:teacher_id] = nil     
        redirect_to root_path 
    end
    
end