class OpeningsController < ApplicationController
  before_action :get_wall_and_check_permission

  def create
    raise params.inspect
  end

  private

  def get_wall_and_check_permission
    @wall = Wall.first
  end
end

