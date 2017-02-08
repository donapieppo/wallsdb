class WallsController < ApplicationController
  skip_before_action :force_sso_user, only: [:index, :show]
  before_action :set_wall_and_check_permission, only: [:edit, :update, :show, :own]

  def index
    @walls = Hash.new{|h,k| h[k] = {}}
    Wall.includes(province: :region).order('regions.id, provinces.name, walls.name').each do |wall|
      @walls[wall.province.region][wall.province] ||= []
      @walls[wall.province.region][wall.province] << wall
    end
  end

  def new
    @wall = Wall.new
  end

  # FIXME admin_id in model
  def create
    @wall = Wall.new(wall_params)
    if @wall.save and current_user.admins.create(wall_id: @wall.id)
      redirect_to [:edit, @wall], notice: 'Il muro è stato registrato. È possibile ora aggiornare le caratteristiche.'
    else
      render action: :new
    end
  end

  def edit
  end

  def update
    if @wall.update_attributes(wall_params)
      redirect_to [:edit, @wall], notice: 'Dati aggiornati correttamente'
    else
      render action: :edit
    end
  end

  def show
    @bg_photo = @wall.photos.where(importance: 1).first
  end

  def own
  end

  private

  def wall_params
    params[:wall].permit(:name, :description, :contact, 
                         :address, :city, :cap, :province_id, :web, :facebook, :instagram,
                         :opening, :prices, :boulder_mq, :boulder_notes, :rope_mq, :rope_notes, :training, :bar, :music)
  end

  def set_wall_and_check_permission
    @wall = Wall.find(params[:id])
  end
end

