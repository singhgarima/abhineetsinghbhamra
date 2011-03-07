class HomesController < ApplicationController
  layout "application", :except => [:gallery, :blog]

  caches_page :gallery

  def gallery
    @images = Image.order("created_at desc").limit(9)
  end

  def blog
    @blog = Blog.order("created_at desc").first
  end
end
