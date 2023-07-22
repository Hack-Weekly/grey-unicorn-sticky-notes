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
      when :guest, :registered then scope.where(owner: user)
      when :admin then scope.all
      else scope.none
      end
    end
  end

  private

  def common_access
    user.has_role?(:admin) || record.owner == user
  end
end
