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
    uploaded_bike_photo = bike_params[:photo].path
    cloudinary_file = Cloudinary::Uploader.upload(uploaded_bike_photo)
    new_bike = {
        :user_id            => bike_params[:user_id],
        :description        => bike_params[:description],
        :brand              => bike_params[:brand],
        :model              => bike_params[:model],
        :color_primary      => bike_params[:color_primary],
        :color_secondary    => bike_params[:color_secondary],
        :color_tertiary     => bike_params[:color_tertiary],
        :serial_num         => bike_params[:serial_num],
        :is_stolen          => bike_params[:is_stolen],
        :stolen_zip         => bike_params[:stolen_zip],
        :stolen_date        => bike_params[:stolen_date],
        :photo              => cloudinary_file['public_id'],
        :frame_size         => bike_params[:frame_size]
    }
    puts '########################'
    puts new_bike
    puts '########################'
    Bike.create(new_bike)
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
