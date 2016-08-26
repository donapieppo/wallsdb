class WallsController < ApplicationController
  before_action :set_show_and_check_permission, only: [:edit, :update, :show]

  def index
    @walls = current_user.walls.all
  end

  def new
    @wall = Wall.new
  end

  # FIXME admin_id in model
  def create
    @wall = Wall.new(wall_params)
    if @wall.save and current_user.admins.create(wall_id: @wall.id)
      redirect_to @wall, notice: 'OK'
    else
      render action: :new
    end
  end

  def edit
    @opening = @wall.openings.new
  end

  def update
    if @wall.update_attributes(wall_params)
      redirect_to @wall, notice: 'OK'
    else
      render action: :edit
    end
  end

  def show
  end

  private

  def wall_params
    params[:wall].permit(:name, :description, :contact, 
                         :address, :city, :cap, :province_id, :web, 
                         :opening, :prices, :mq, :boulder, :rope, :training, :bar, :music)
  end

  def set_show_and_check_permission
    @wall = Wall.find(params[:id])
  end
end

