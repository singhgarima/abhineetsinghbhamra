class HomesController < ApplicationController
  layout "application", :except => [:gallery]

  caches_page :gallery

  def gallery
    @images = Image.order("created_at desc").limit(9)
  end
end
