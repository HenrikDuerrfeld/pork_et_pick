class BookingsController < ApplicationController
  def new
    @pig = Pig.find(params[:pig_id])
    @user = current_user
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @pig = Pig.find(params[:pig_id])
    @user = current_user
    @booking.pig = @pig
    @booking.user = @user
    if @booking.save
      redirect_to pig_path(@pig)
    else
      render :new
    end
  end

  def dashboard
    @user = current_user
    @bookings = Booking.where(user: @user)
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = true
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.status = false
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total)
  end
end
