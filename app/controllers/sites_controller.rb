class SitesController < ApplicationController

  

  def index
    @photos = Photo.all
  end
end
