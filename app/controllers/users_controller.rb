class UsersController < ApplicationController
  before_action :set_user, only: %i[ destroy ]
  skip_before_action :protect_pages, only: [:new, :create]

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users 
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/', notice: "Usuario creado"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # DELETE /users/1 
  def destroy
    @user.destroy!
    redirect_to '/', notice: "User was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end