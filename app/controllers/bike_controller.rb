class BikeController < ApplicationController
  before_action :current_user, :is_authenticated
  def show
     @bike = Bike.find(params[:id])
  end

  def new
    @bike = Bike.new
  end

  def index
    @users = User.all

  end

  def create
    Bike.create(bike_params)
    redirect_to root_path
  end

  def edit
    @bike = Bike.find(params[:id])
  end

  def update
    b = Bike.find(params[:id])
    b.update(bike_params)
    redirect_to root_path
  end

  def delete
  end


  def destroy
    Bike.find(params[:id]).delete
    redirect_to root_path

  end

  private

  def bike_params
    defaults = { user_id: current_user.id }
   params.require(:bike).permit(:user_id, :description, :brand, :model, :color_primary, :color_secondary, :color_tertiary, :serial_num, :is_stolen, :stolen_zip, :stolen_date, :photo, :frame_size).reverse_merge(defaults)
  end
end
