  class InitializeBookingService
    def initialize(chatroom_id)
      @chatroom_id = chatroom_id
    end

    def call
      # chatroom = Chatroom.find(chatroom_id)
      booking = Booking.new(booking_params)
      business = Chatroom.find(chatroom_id).business
      customer = Chatroom.find(chatroom_id).customer.id
      contractor = Chatroom.find(chatroom_id).contractor.id
      booking.contractor_id = contractor
      booking.business = business
      booking.customer_id = customer
      booking.user_id = contractor
      booking
    end
  end
