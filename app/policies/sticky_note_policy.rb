class StickyNotePolicy < ApplicationPolicy
  def show?
    true
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true
  end

  class Scope < Scope
    def resolve
      case user.role
      when :guest      then scope.where(guest_id: user.guest_id)
      when :registered then scope.where(user:)
      when :admin      then scope.all
      else scope.none
      end
    end
  end
end
