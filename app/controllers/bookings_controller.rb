class BookingsController < ApplicationController
  # before_action :find_business, only: [:create]

  def index
    @bookings = policy_scope(Booking)
    # @bookings = Booking.where(customer_id: current_user)
    authorize @bookings
  end

  def show
    # raise
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    # If redirecting is the better choice
    # redirect_back fallback_location: root_path unless current_user.role == "Contractor"
    @booking = Booking.new
    authorize @booking
  end

  def create
    # initialize new booking
    @chatroom = Chatroom.find(params[:chatroom_id])
    @booking = Booking.new(booking_params)
    @business = Chatroom.find(params[:chatroom_id]).business
    @customer = Chatroom.find(params[:chatroom_id]).customer.id
    @contractor = Chatroom.find(params[:chatroom_id]).contractor.id
    @booking.contractor_id = @contractor
    @booking.business = @business
    @booking.customer_id = @customer
    authorize @booking

    if @booking.save!
      redirect_back(fallback_location: 'chatrooms/index')
    else
      render "businesses/show"
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    authorize @booking
    if @booking.confirmed == true
      flash.notice = "Booking confirmed"
    elsif @booking.confirmed == false
      flash.notice = "Booking Declined"
    end
    redirect_back(fallback_location: 'chatrooms/index')
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    authorize @booking
    flash.notice = "Booking declined"
    redirect_back(fallback_location: 'chatrooms/index')
  end

  private

  def find_business
    @business = Business.find(params[:business_id])
  end

  def booking_params
    params.require(:booking).permit(:price, :start_date, :end_date, :confirmed, :description)
  end
end
