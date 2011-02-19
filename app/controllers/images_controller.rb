class ImagesController < ApplicationController
  caches_page :show

  def show
    if @image = Image.find_by_human_name(params[:file_name])
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

  def attach
    redirect_to root_path and return if params[:attachment].blank?
    expire_page :action => :index

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

end
