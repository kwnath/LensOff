class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @lense = Lense.find(params[:lense_id])
    @booking = Booking.new
  end

  def create
    @lense = Lense.find(params[:lense_id])
    @booking = Booking.new(booking_params)
    @booking.lense = @lense
    @booking.user = current_user

    if @booking.save
      redirect_to lenses_path
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
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
    params.require(:booking).permit(:start_date, :end_date)
  end

end