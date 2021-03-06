class AdminsController < ApplicationController
  before_action :set_wall_and_check_permission, only: [:edit, :update, :show]

  def index
    @walls = current_user.master_of_universe? ? Wall.includes(admins: :user) : current_user.walls.includes(admins: :user)
  end

  def new
    @wall = Wall.find(params[:wall_id])
    @admin = @wall.admins.new
  end

  def create
    @wall = Wall.find(params[:wall_id])
    current_user.owns!(@wall) 

    @user = User.where(email: params[:email]).first || User.create(email: params[:email], name: params[:email])

    @admin = @wall.admins.new(user: @user)
    if @admin.save
      redirect_to admins_path, notice: "Amministratore #{@user.name} aggiunto a #{@wall.name}."
    else
      render :new
    end
  end

  def destroy
    admin = Admin.find(params[:id])
    current_user.owns!(admin.wall)
    admin.destroy and flash[:notice] = 'Amministratore cancellato correttamente.'
    redirect_to root_path
  end

  private

  def set_wall_and_check_permission
    @wall = Wall.find(params[:id])
    current_user.owns!(@wall) 
  end

end



