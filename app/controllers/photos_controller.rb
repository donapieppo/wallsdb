class PhotosController < ApplicationController
  before_action :get_photo_and_check_permission, only: [:destroy, :header_image]
  before_action :get_wall_and_event_and_check_permission, only: [:create]

  def new
    @photo = Photo.new
  end

  def create
    @photo = (@wall || @event).photos.new(photo_params)
    if @photo.save
      if @wall
        redirect_to edit_wall_path(@wall, anchor: "images") 
      else
        redirect_to edit_event_path(@event)
      end
    else
      render action: :new
    end
  end

  def destroy
    if @photo.delete
      redirect_to [:edit, @parent]
    end
  end

  def header_image
    @parent.photos.each do |photo|
      photo.update_attribute(:importance, (@photo == photo) ? 1 : 2)
    end
  end

  private

  def photo_params
    params[:photo].permit(:image, :importance, :remote_image_url)
  end

  def get_photo_and_check_permission
    @photo = Photo.find(params[:id])
    @parent = @photo.wall || @photo.event
    current_user.owns!(@parent)
  end

  def get_wall_and_event_and_check_permission
    @wall  = params[:wall_id]  ? Wall.find(params[:wall_id]) : nil
    @event = params[:event_id] ? Event.find(params[:event_id]) : nil
    current_user.owns!(@wall || @event)
  end
end

