class ChatroomsController < ApplicationController

  def index
    @chatrooms = policy_scope(Chatroom)
  end


  def show
    @chatrooms = policy_scope(Chatroom)
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @booking = Booking.new
    @pending_booking = Booking.where(customer_id: @chatroom.customer, contractor_id: @chatroom.contractor)
    authorize @chatroom
  end

  def confirm_booking
    @pending_booking = Booking.where(customer_id: @chatroom.customer, contractor_id: @chatroom.contractor)
    @pending_booking.confirmed = true
  end


  def create
    @chatroom = Chatroom.new
    @chatroom.customer_id = current_user.id
    @chatroom.contractor_id = Business.find(params[:business_id]).user_id
    @chatroom.business = Business.find(params[:business_id])
    @chatroom.save
    redirect_to chatroom_path(@chatroom)
    authorize @chatroom
  end

  private

  def chat_params
    params.require(:chatroom).permit(:name)
  end


end
