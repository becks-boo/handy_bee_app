class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # Is this even necessary?
  def initialize(user, booking)
    @user = user
    @booking = booking
  end

  # Does that mean that everyone can see all bookings?
  def index?
    true
  end

  def new?
    # current_user.role == "Contractor"?
    user.role == "Contractor"
  end

  def create?
    # What about create, also only the contractor?
    user.role == "Contractor"
  end
end
