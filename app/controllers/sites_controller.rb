class SitesController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create, :show]

  def index
    @photos = Photo.all
  end
end
