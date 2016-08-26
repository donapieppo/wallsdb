class HomeController < ApplicationController

  def index
    @walls = Wall.all
  end

end
