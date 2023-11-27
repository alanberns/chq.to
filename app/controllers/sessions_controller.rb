class SessionsController < ApplicationController
    skip_before_action :protect_pages

    # GET /login
    def new
    end

    # POST /login
    def create
        @user = User.find_by(username: params[:username])
        if @user&.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to '/links', notice: "Bienvenido #{@user.username}"
        else
            redirect_to login_path, alert: "Usuario y/o contraseña inválidos"
        end 
    end

    def destroy 
        session[:user_id] = nil
        Current.user = nil
        redirect_to '/', notice: "Sesión cerrada"
    end

    private
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :password)
    end
end