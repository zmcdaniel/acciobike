class BikeController < ApplicationController
       # require the gems we need
      require 'rest-client'
      require 'nokogiri'
  before_action :current_user, :is_authenticated
  def show
     @bike = Bike.find(params[:id])

    #request data
    response = RestClient.get("https://seattle.craigslist.org/search/bia")
    html = response.body
    #give Nokogiri your file
    data = Nokogiri::HTML(html)
    ##select data using CSS selectors
    puts '#######before#########'
    data.css("a.hdrlnk:contains('#{@bike.brand}')").each do |title|
      @titles = title.text
      puts title.text
      puts '########inside##########'
      # @links = title
    end
    puts '########after##########'

   ###:contains('#{@bike.brand}')
    #puts data.css("p.row a span.price")[0] ###This gets the price of first bike
    # puts data.css("p.row a.i.gallery")[0] ##This gets the whole first <a> tag
    #puts data.css("div.swipe")[0].text
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

  def results
    query = params[:search]
    if query
      @bikes = Bike.search(query)
    else
      @bikes = Bike.all
    end
  end




  private

  def bike_params
    defaults = { user_id: current_user.id }
    params.require(:bike).permit(:user_id,
                                :description,
                                :brand,
                                :model,
                                :color_primary,
                                :color_secondary,
                                :color_tertiary,
                                :serial_num,
                                :is_stolen,
                                :stolen_zip,
                                :stolen_date,
                                :photo,
                                :frame_size).reverse_merge(defaults)
  end
end
