# require 'test_helper'
require_relative '../../app/services/initialize_booking_service'

describe InitializeBookingService do
  describe "#call" do
    subject { described_class.new(1).call() }

    it "creates a new booking" do
      booking = subject
      expect(booking).not_to be_nil
      expect(booking.chatroom).not_to be_nil
    end
  end
end
