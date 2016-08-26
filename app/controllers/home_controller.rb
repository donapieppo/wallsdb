class HomeController < ApplicationController

  def index
    @walls = Wall.includes(province: :region).order('regions.name')
  end

end
