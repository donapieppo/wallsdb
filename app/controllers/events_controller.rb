class EventsController < ApplicationController
  before_action :get_wall_and_check_permission

  def new
    @event = Event.new
  end

  def create
    @event = @wall.events.new(event_params)
    if @event.save
      redirect_to @wall
    else
      render action: :new
    end
  end

  private

  def event_params
    params[:event].permit(:name, :description)
  end

  def get_wall_and_check_permission
    @wall = Wall.first
  end
end

