class PhotosController < ApplicationController
  before_action :get_wall_and_check_permission

  def new
    @photo = Photo.new
  end

  def create
    @photo = @wall.photos.new(photo_params)
    if @photo.save
      redirect_to @wall
    else
      render action: :new
    end
  end

  private

  def photo_params
    params[:photo].permit(:image, :importance)
  end

  def get_wall_and_check_permission
    @wall = Wall.first
  end
end

