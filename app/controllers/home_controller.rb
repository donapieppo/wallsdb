class HomeController < ApplicationController
  skip_before_action :force_sso_user

  def index
    @home_header = true
    @walls = Wall.includes(province: :region).order('regions.name')
    @events = Event.includes(:photos).order(:start_date).limit(10)
  end

  def show_province
    @province = Province.where(name: params[:province]).first
    @walls = @province ? @province.walls : []
  end

end
