class BusinessLanguagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    user.role == "Contractor"
  end

  def create?
    user.role == "Contractor"
  end
end
