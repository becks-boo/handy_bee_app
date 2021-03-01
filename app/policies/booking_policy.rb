class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(customer_id: user).or(scope.where(contractor_id: user))
    end
  end

  # Is this even necessary?
  # def initialize(user, booking)
  #   @user = user
  #   @booking = booking
  # end

  # Does that mean that everyone can see all bookings?
  def index?
    true
  end

  def new?
    user.role == "Contractor"
    # If redirecting is the better choice
    # true
  end

  def show?
    true
  end

  def create?
    # What about create, also only the contractor?
    user.role == "Contractor"
  end

  def update?
    true
  end

  def destroy?
    true
  end

end
