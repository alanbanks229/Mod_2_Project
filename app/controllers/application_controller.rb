class ApplicationController < ActionController::Base

    helper_method :current_user
    helper_method :current_post
    def current_user
        # memoization
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        else
            @current_user = "Guest"
        end
        return @current_user
    end

    def current_post
        if session[:post_id]
            @current_post ||= Post.find(session[:post_id])
        end
        return @current_post
    end
end
