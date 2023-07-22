class WorkspacePolicy < ApplicationPolicy
  def index?
    true
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
end
