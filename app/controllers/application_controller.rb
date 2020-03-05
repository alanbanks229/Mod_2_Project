class ApplicationController < ActionController::Base

    helper_method :current_user
    helper_method :current_post

    def current_user
        # memoization
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        else
            @current_user = nil
        end
        return @current_user
    end

    def current_post
        if session[:post_id]
            @current_post ||= Post.find(session[:post_id])
        end
        return @current_post
    end

    def logged_in?
        !!current_user #one bang converts into boolean...
    end

    def admin
        flash[:alert] = "Only Admins have that capability!"
        redirect_to login_path unless current_user.admin
    end

    def authorized
        flash[:login_warning] = "You must be logged in to use that function"
        redirect_to login_path unless logged_in?
    end

end
