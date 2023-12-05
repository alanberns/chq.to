class ApplicationController < ActionController::Base
    before_action :set_current_user
    before_action :protect_pages

    private
    def set_current_user
        Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def protect_pages
        redirect_to login_path, alert: 'Inicia sesión' unless Current.user
    end

    def protect_unauthorized(link_user_id)
        # Raise unauthorized
        redirect_to '/403' unless Current.user.id == link_user_id
    end
end