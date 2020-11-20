class BookingPolicy < ApplicationPolicy
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

  def create?
    true
  end

  def destroy?
    record.user == user || record.conveying.user == user
  end

  def accept?
    record.conveying.user == user
  end
end
