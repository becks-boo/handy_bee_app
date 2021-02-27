class ChatroomPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(customer_id: user).or(scope.where(contractor_id: user))
    end
  end

    def show?
      true
    end

    def create?
      true
    end
end
