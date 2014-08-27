class PhotosController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create, :show]

  def new
    @photo = Photo.new
  end

  def create

    new_photo = current_user.photos.new(photo_params)
    if new_photo.url?
      new_photo.save
    else
      uploader = PhotoUploader.new
      uploader.store!(new_photo.image)
      new_photo.save
    end

    redirect_to root_path
  end

  def show
  end

  private

  def photo_params
    params.require(:photo).permit(:url, :image)
  end
end
