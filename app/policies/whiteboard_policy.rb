class WhiteboardPolicy < ApplicationPolicy
  def new?
    create?
  end

  def create?
    # The user can create a whiteboard if they are logged in (assuming there is a `user` method for this)
    user.present?
  end

  def show?
    user == record.workspace.owner
  end

  def completed?
    user == record.workspace.owner
  end

  def update?
    # The user can update the whiteboard if they own it (assuming `whiteboard` has an `user` association)
    user.present? && record.user == user
  end

  def destroy?
    update?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
