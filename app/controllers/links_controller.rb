class LinksController < ApplicationController
include LinksHelper
  before_action :set_link, only: %i[ show edit update destroy ]

  # GET /links 
  def index
    @links = Link.where(user_id: Current.user.id)
  end

  # GET /links/1 
  def show
    @complete_slug = generate_link(@link.slug)
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

  # GET /l/:slug
  def slug
    @link = Link.find_by(slug: params[:slug])
    unless @link
      raise ActionController::RoutingError.new('Not Found')
    else
      case @link.link_type
      when 'regular'
        redirect_to @link.url, allow_other_host: true
      when 'privado'
        render :post_slug, @link=> @link
      when 'temporal'
        redirect_to @link.url, allow_other_host: true if @link.expires_at > DateTime.now
        raise ActionController::RoutingError.new('Not Found')
      when 'efimero'
        if @link.remaining_accesses > 0
          @link.remaining_accesses = @link.remaining_accesses.pred 
          @link.save
          redirect_to @link.url, allow_other_host: true 
        else
          raise ActionController::RoutingError.new('Forbidden')
        end
      end
    end
  end

  # POST /l/:slug
  def post_slug
    @link = Link.find_by(slug: params[:slug])
    if @link&.authenticate(params[:password])
      redirect_to @link.url, allow_other_host: true 
    else 
      flash['alert']='Contraseña incorrecta'
      render :post_slug, @link=> @link, status: :unprocessable_entity
    end
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
