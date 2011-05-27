class BlogsController < ApplicationController
  before_filter :authenticate_user!, :only => [:index, :new, :edit, :create, :update, :destroy]
  def index
    @blogs = Blog.all
  end

  def archive
    @blogs = Blog.order("created_at desc").group_by{ |g| g.created_at.strftime("%B, %Y")}
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = Blog.new(params[:blog])
    if @blog.save
      expire_page(:controller => :homes, :action => :gallery)
      redirect_to(@blog, :notice => 'Blog was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(params[:blog])
      redirect_to(@blog, :notice => 'Blog was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to(blogs_url)
  end
end
