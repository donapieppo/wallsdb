class HomeController < ApplicationController
  skip_before_action :force_sso_user

  def index
    @home_header    = true
    @search_in_menu = true
    @walls  = Wall.includes(province: :region).order('regions.name, walls.name')
    if params[:province] 
      @province = Province.where(name: params[:province]).first
      @walls = @walls.where(province_id: @province.id) if @province
    end
    @events = Event.includes(:photos, :wall).future.limit(10).all + 
              Event.includes(:photos, :wall).past.limit(10).all
  end

  def search
    if province = Province.where(name: params[:search_string]).first
      @walls = province.walls.order(:name)
    elsif wall = Wall.where(name: params[:search_string]).first
      @walls = [wall]
    else
      @walls = []
    end
  end

  def privacy
  end
end
