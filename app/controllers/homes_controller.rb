class HomesController < ApplicationController
  caches_page :gallery

  def index
    @blogs = Blog.select("id, name").order("created_at desc").limit(3)
    p @blogs
  end

  def gallery
    @images = Click.latest(6).collect(&:first)
  end

  def blog
    p params
    @blog = Blog.find(params["id"])
  end
end
