class PhotosController < ApplicationController
  before_action :get_wall_and_event_and_check_permission, only: [:create]

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

  def destroy
    @photo = Photo.find(params[:id])
    @parent = @photo.wall || @photo.event
    current_user.owns!(@parent)
    if @photo.delete
      redirect_to [:edit, @parent]
    end
  end

  private

  def photo_params
    params[:photo].permit(:image, :importance)
  end

  def get_wall_and_event_and_check_permission
    @wall  = params[:wall_id]  ? Wall.find(params[:wall_id]) : nil
    @event = params[:event_id] ? Event.find(params[:event_id]) : nil
    current_user.owns!(@wall || @event)
  end
end

