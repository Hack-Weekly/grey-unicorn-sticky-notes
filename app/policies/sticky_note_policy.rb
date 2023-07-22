class StickyNotePolicy < ApplicationPolicy
  def show?
    common_access
  end

  def create?
    true
  end

  def update?
    common_access
  end

  def destroy?
    common_access
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

  private

  def common_access
    case user
    when Guest then record.guest_id == user.guest_id
    when User  then user.has_role?(:admin) || record.user == user
    end
  end
end
