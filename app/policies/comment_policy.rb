class CommentPolicy < ApplicationPolicy
    class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    return true
  end

  def destroy?
    record.task.user == user
  end
end
