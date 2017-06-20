class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to lense_booking_path(@booking)
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    render :new
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to lense_booking_path(@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to lense_bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :start_date, :end_date, :lense_id)
  end

end
