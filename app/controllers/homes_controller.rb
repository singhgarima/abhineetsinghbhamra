class HomesController < ApplicationController
  layout "application", :except => [:gallery]

  caches_page :gallery

  def gallery
    @images = Image.all
  end
end
