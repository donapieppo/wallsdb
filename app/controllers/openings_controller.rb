class OpeningsController < ApplicationController
  before_action :get_wall_and_check_permission

  def create
    params[:wday].each do |wday|
      @wall.openings.create(wday: wday, time_open: params[:open_hour] + ":" + params[:open_min], 
                                        time_close: params[:close_hour] + ":" + params[:close_min])
    end
    redirect_to [:edit, @wall]
  end

  private

  def get_wall_and_check_permission
    @wall = Wall.first
  end
end

