class ImagesController < ApplicationController
  caches_page :show, :gallery
  layout "application", :except => [:show, :create]
  before_filter :authenticate_user!, :only => [:new, :create, :index]

  def index
    @images = Image.all
  end

  def gallery
    @images = Image.paginate :page => params[:page], :order => "created_at DESC"
  end

  def art
    @image = Image.find_by_human_name(params[:file_name])
  end

  def show
    get_image(params[:file_name])
  end

  def new
    @image = Image.new
  end

  def create
    redirect_to root_path and return if params[:attachment].blank?
    expire_page(:controller => :homes, :action => :gallery)
    expire_page(:controller => :images, :action => :gallery)

    @attachment               = Image.new
    @attachment.uploaded_file = params[:attachment]
    @attachment.qoute         = params[:qoute]
    if @attachment.save
      flash[:notice] = "Thank you for your submission..."
      redirect_to root_path
    else
      flash[:error] = "There was a problem submitting your attachment."
      render :index
    end
  end

  private

  def get_image file_name
    if @image = Image.find_by_human_name(file_name)
      send_data(
        @image.content,
        :type        => @image.content_type,
        :filename    => @image.name,
        :disposition => 'inline'
      )
    else
      render :file => "#{RAILS_ROOT}/public/404.html", :status => 404
    end
  end

end
