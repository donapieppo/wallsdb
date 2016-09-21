class EventsController < ApplicationController
  skip_before_action :force_sso_user, only: :show
  before_action :get_wall_and_check_permission, only: [:new, :create]
  before_action :get_event_and_check_permission, only: [:edit, :update, :delete]

  def new
    @event = @wall.events.new(start_date: Date.today + 1.week + 12.hours, end_date: Date.today + 1.week + 22.hours)
  end

  def create
    @event = @wall.events.new(event_params)
    if @event.save
      redirect_to [:edit, @event]
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @event.update_attributes(event_params)
      redirect_to [:edit, @event], notice: 'OK'
    else
      render action: :edit
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params[:event].permit(:name, :description, :start_date, :end_date)
  end

  def get_wall_and_check_permission
    @wall = Wall.find(params[:wall_id]) 
    current_user.owns!(@wall)
  end

  def get_event_and_check_permission
    @event = Event.includes(:wall).find(params[:id])
    current_user.owns!(@event.wall)
  end
end

