class ApplicationController < ActionController::Base

    def current_user
        Teacher.find_by(id: session[:teacher_id])
      end

end
