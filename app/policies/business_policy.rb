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
    record.contractor == user
  end

  def update?
    record.contractor == user
  end

  def destroy?
    record.contractor == user
  end

  def delete_image_attachment?
    record.contractor == user
  end
end
