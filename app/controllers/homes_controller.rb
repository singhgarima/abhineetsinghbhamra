class HomesController < ApplicationController
  layout "application", :except => [:gallery]

  caches_page :gallery
end
