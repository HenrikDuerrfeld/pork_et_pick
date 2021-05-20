class PigsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    skip_policy_scope
    @pigs = Pig.all
    @markers = @pigs.geocoded.map do |pig|
      {
        lat: pig.latitude,
        lng: pig.longitude,
        infoWindow: render_to_string(partial: 'info_window', locals: { pig: pig }),
        image_url: helpers.asset_url('http://pngimg.com/uploads/pig/pig_PNG2202.png')
      }
    end
  end

  def show
    @pig = Pig.find(params[:id])
    authorize @pig
  end

  def new
    @pig = Pig.new
    authorize @pig
  end

  def create
    @pig = Pig.new(pig_params)
    @pig.user = current_user
    authorize @pig
    if @pig.save
      redirect_to pig_path(@pig)
    else
      render :new
    end
  end

  def edit
    @pig = Pig.find(params[:id])
    authorize @pig
  end

  def update
    @pig = Pig.find(params[:id])
    @pig.update(pig_params)
    redirect_to pig_path(@pig)
    authorize @pig
  end

  def destroy
    @pig = Pig.find(params[:id])
    @pig.destroy
    redirect_to pigs_path
    authorize @pig
  end

  private

  def pig_params
    params.require(:pig).permit(:description, :name, :price_per_day, :status, :user_id, :photo, :location)
  end

end
