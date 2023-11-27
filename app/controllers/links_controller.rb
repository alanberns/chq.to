class LinksController < ApplicationController
include LinksHelper
  before_action :set_link, only: %i[ show edit update destroy ]

  # GET /links 
  def index
    @links = Link.where(user_id: Current.user.id)
  end

  # GET /links/1 
  def show
  end

  # GET /links/new
  def new
    @link = Link.new
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  def create
    @link = Link.new(link_params)
    @link.user_id = Current.user.id
    @link.slug = create_slug
    if @link.save
      redirect_to links_url, notice: "Link was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /links/1
  def update
    if @link.update(link_params)
      redirect_to links_url, notice: "Link was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /links/1
  def destroy
    @link.destroy!

    redirect_to links_url, notice: "Link was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link = Link.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def link_params
      params.require(:link).permit(:url, :name, :expires_at, :password, :remaining_accesses, :link_type)
    end
end
