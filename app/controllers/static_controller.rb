class StaticController < ApplicationController
  
    def home
      @teacher = current_user
    end
    
  end