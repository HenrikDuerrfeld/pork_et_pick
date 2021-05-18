class PigsController < ApplicationController

  def index
    @pigs = Pig.all
  end

  def show
    @pig = Pig.find(params[:id])
  end

  def new
    @pig = Pig.new
  end

  def create
    @pig = Pig.new(pig_params)
    @pig.user = current_user
    if @pig.save
      redirect_to pig_path(@pig)
    else
      render :new
    end
  end

  def edit
    @pig = Pig.find(params[:id])
  end

  def update
    @pig = Pig.find(params[:id])
    @pig.update(pig_params)
    redirect_to pig_path(@pig)
  end

  def destroy
    @pig = Pig.find(params[:id])
    @pig.destroy
    redirect_to pigs_path
  end

  private

  def pig_params
    params.require(:pig).permit(:description, :name, :price_per_day, :status, :user_id, :photo)
  end

end
