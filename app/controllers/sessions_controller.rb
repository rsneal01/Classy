class SessionsController < ApplicationController
    def new
        @teacher = Teacher.new
    end

    def create
        if @teacher = Teacher.find_by(name: params[:name])
            session[:teacher_id] = @teacher.id
            redirect_to teacher_path(@teacher)
        # elsif @teacher = Teacher.find_by(id: params[:teacher_id])
        #     session[:teacher_id] = @teacher.id
        else
            redirect_to new_teacher_path
        end
            # auth = request.env["omniauth.auth"]
            # teacher = Teacher.where(:provider => auth['provider'],
            #                   :uid => auth['uid'].to_s).first || Teacher.create_with_omniauth(auth)
                              
            # reset_session
            # session[:teacher_id] = teacher.id
            # redirect_to root_path, :notice => 'Signed in!'
        
    end

    def omni_create
        auth = request.env["omniauth.auth"]
        teacher = Teacher.where(:provider => auth['provider'],
                          :uid => auth['uid'].to_s).first || Teacher.create_with_omniauth(auth)
                          
        reset_session
        session[:teacher_id] = teacher.id
        redirect_to teacher_path(teacher), :notice => 'Signed in with github!'
    end


    def destroy
        session[:teacher_id] = nil     
        redirect_to root_path 
    end
    
end