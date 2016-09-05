class PhotosController < ApplicationController
  before_action :get_wall_and_check_permission

  def new
    @photo = Photo.new
  end

  def create
    @photo = (@wall || @event).photos.new(photo_params)
    if @photo.save
      redirect_to [:edit, @wall || @event]
    else
      render action: :new
    end
  end

  private

  def photo_params
    params[:photo].permit(:image, :importance)
  end

  def get_wall_and_check_permission
    @wall  = params[:wall_id]  ? Wall.find(params[:wall_id]) : nil
    @event = params[:event_id] ? Event.find(params[:event_id]) : nil
    current_user.owns!(@wall || @event)
  end
end

