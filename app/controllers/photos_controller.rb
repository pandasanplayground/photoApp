class PhotosController < ApplicationController

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
      binding.pry
    end
  end

  def show
  end

  private

  def photo_params
    params.require(:photo).permit(:url, :image)
  end
end
