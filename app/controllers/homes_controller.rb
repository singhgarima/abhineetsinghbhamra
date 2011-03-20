class HomesController < ApplicationController
  layout "application", :except => [:gallery, :blog]

  caches_page :gallery

  def gallery
    @images = Click.latest(6).collect(&:first)
  end

  def blog
    @blog = Blog.order("created_at desc").first
  end
end
