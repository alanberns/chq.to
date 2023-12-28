class ApplicationController < ActionController::Base
    before_action :set_current_user

    private
        def set_current_user
            Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
        end

        def protect_pages
            redirect_to login_url, alert: 'Inicia sesión' unless Current.user
        end

        def protect_unauthorized(user_id)
            # Raise unauthorized
            redirect_to forbidden_url unless Current.user.id == user_id
        end
end