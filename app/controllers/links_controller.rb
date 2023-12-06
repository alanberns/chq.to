class LinksController < ApplicationController
include LinksHelper
  before_action :set_link, only: %i[ show edit update destroy ]

  # GET /links 
  def index
    @links = Link.where(user_id: Current.user.id).page(params[:page]).per(2)
  end

  # GET /links/1 
  def show
    protect_unauthorized(@link.user_id)
    @complete_slug = generate_link(@link.slug)
  end

  # GET /links/new
  def new
    @link = Link.new
    @link.type = params[:type]
  end

  # GET /links/1/edit
  def edit
    protect_unauthorized(@link.user_id)
  end

  # POST /links
  def create
    @link = Link.new(link_params)
    @link.user_id = Current.user.id
    @link.slug = create_slug
    @link.remaining_accesses = 1 if @link.type == 'Ephemeral'
    if @link.save
      redirect_to links_url, notice: "Link was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /links/1
  def update
    protect_unauthorized(@link.user_id)
    if @link.update(link_params)
      redirect_to links_url, notice: "Link was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /links/1
  def destroy
    protect_unauthorized(@link.user_id)
    @link.destroy!

    redirect_to links_url, notice: "Link was successfully destroyed."
  end

  # GET /l/:slug
  def slug
    @link = Link.find_by(slug: params[:slug])
    unless @link
      redirect_to '/404'
    else
      case @link.type
      when 'Regular'
        redirect
      when 'Private'
        render :post_slug, @link=> @link
      when 'Temporal'
        if @link.expires_at > DateTime.now
          redirect 
        else
          redirect_to '/404'
        end
      when 'Ephemeral'
        if @link.remaining_accesses > 0
          @link.decrement!(:remaining_accesses)
          @link.save
          redirect 
        else      
          redirect_to '/403'
        end
      end
    end
  end

  # POST /l/:slug
  def post_slug
    @link = Link.find_by(slug: params[:slug])
    if @link&.authenticate(params[:password])
      redirect
    else 
      flash['alert']='Contraseña incorrecta'
      render :post_slug, @link=> @link, status: :unprocessable_entity
    end
  end

  def type
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      begin
        @link = Link.find(params[:id])
      rescue
        redirect_to '/404'
      end
    end

    def redirect
      # ESTADISTICAS
      redirect_to @link.url, allow_other_host: true, status: :found
    end

    # Only allow a list of trusted parameters through.
    def link_params
      params.require(:link).permit(:url, :name, :expires_at, :password, :remaining_accesses, :link_type, :type)
    end
end
