class ApplicationController < ActionController::Base

#layout 'application'

    def current_user
        return unless session[:user_id]
        @current_user ||= User.find(session[:user_id])
    end
    def logged_in?
        if session[:user_id]
            return true
        else
flash[:failure]="You must be logged in to complete this action."
            redirect_to login_path
        end
    end
end
