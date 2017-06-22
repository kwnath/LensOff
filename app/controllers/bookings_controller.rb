class BookingsController < ApplicationController
  before_action :authenticate_user!
  def show
    @booking = Booking.find(params[:id])
    if @booking.user == current_user
      return @booking
    else
      redirect_to error_path
    end

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
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @booking = Booking.find(params[:id])
    if @booking.user == current_user
      @lense = Lense.find(params[:lense_id])
      render :new
    else
      redirect_to error_path
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to lense_booking_path(params[:lense_id],@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.user == current_user
      @booking.destroy
      redirect_to dashboard_path
    else
      redirect_to error_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
