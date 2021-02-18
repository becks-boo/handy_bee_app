class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def new
    current_user.role == "Contractor" ? true : false
  end

  def create?
    true
  end
end
