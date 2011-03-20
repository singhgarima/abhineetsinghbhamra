class ExtImagesController < ApplicationController
  def create
    redirect_to root_path and return if params[:ext_image].blank?
    @ext_image = ExtImage.new(params[:ext_image])
    p @ext_image.valid?, @ext_image.errors
    render "images/new" unless @ext_image.save
    redirect_to root_path
  end

  def gallery
    @images = ExtImage.paginate :page => params[:page], :order => "created_at DESC"
  end
end
