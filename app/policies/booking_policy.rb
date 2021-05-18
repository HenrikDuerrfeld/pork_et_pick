class BookingPolicy < ApplicationPolicy
  def create?
    return true
  end
  def dashboard?
    return true
  end
  def accept?
    record.pig.user == user
  end
  def decline? 
    record.pig.user == user
  end
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
