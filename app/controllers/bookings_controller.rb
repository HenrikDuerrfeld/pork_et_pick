class BookingsController < ApplicationController
  def new
    @pig = Pig.find(params[:pig_id])
    @user = current_user
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @pig = Pig.find(params[:pig_id])
    @user = current_user
    @booking.pig = @pig
    @booking.user = @user
    authorize @booking
    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def dashboard
    @bookings = Booking.where(user: current_user)
    @pigs = current_user.pigs
    @demands = Booking.where(pig: @pigs)
    authorize @bookings
  end

  def accept
    @booking = Booking.find(params[:id])



    @booking.update(status: true)
    redirect_to dashboard_path(active_tab: 2)
    authorize @booking

  end

  def decline
    @booking = Booking.find(params[:id])

    @booking.update(status: false)
    redirect_to dashboard_path(active_tab: 2)
    authorize @booking

  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total, :status)
  end
end
