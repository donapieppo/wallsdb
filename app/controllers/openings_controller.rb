class OpeningsController < ApplicationController
  before_action :get_wall_and_check_permission, only: [:create]

  def create
    params[:wday].each do |wday|
      @wall.openings.create(wday: wday, time_open: params[:open_hour] + ":" + params[:open_min], 
                                        time_close: params[:close_hour] + ":" + params[:close_min])
    end
    redirect_to [:edit, @wall]
  end

  def destroy
    opening = Opening.includes(:wall).find(params[:id])
    if current_user.owns?(opening)
      opening.delete
    end
    redirect_to [:edit, opening.wall]
  end

  private

  def get_wall_and_check_permission
    @wall = Wall.find(params[:wall_id])
  end
end

