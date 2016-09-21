class HomeController < ApplicationController
  skip_before_action :force_sso_user

  def index
    @home_header    = true
    @search_in_menu = true
    @walls  = Wall.includes(province: :region).order('regions.name')
    if params[:province] 
      @province = Province.where(name: params[:province]).first
      @walls = @walls.where(province_id: @province.id) if @province
    end
    @events = Event.includes(:photos).order(:start_date).limit(10)
  end

  def show_province
    @province = Province.where(name: params[:province]).first
    @walls = @province ? @province.walls.order(:name) : []
  end

end
