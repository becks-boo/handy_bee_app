class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    # If redirecting is the better choice
    # redirect_back fallback_location: root_path unless current_user.role == "Contractor"
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

  def edit
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:price, :start_date, :end_date)
  end
end
