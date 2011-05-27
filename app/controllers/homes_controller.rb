class HomesController < ApplicationController
  caches_page :index

  def index
    @blogs = Blog.select("id, name").order("created_at desc").limit(3)
  end

  def blog
    @blog = Blog.find(params["id"])
  end
end
