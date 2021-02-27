class BusinessPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def new?
    user.role == "Contractor"
  end

  def create?
    user.role == "Contractor"
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end
end
