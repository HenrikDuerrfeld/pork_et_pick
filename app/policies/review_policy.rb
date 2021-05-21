class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def new 
      return true 
    end
    def create 
      return true 
    end  
    def resolve
      scope.all
    end
  end
end
