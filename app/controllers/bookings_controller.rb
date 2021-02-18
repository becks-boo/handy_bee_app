class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    # initialize new booking
    @booking = Booking.new(booking_params)
    @booking.user = current_user

    @booking.business = @business
    authorize @booking

    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render "businesses/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:price, :start_date, :end_date)
  end
end
