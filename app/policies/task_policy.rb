class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    return true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end

  def move?
    record.user == user
  end

  def mark_as_done?
    record.user == user
  end

  def mark_as_cancelled?
    record.user == user
  end

  def mark_as_todo?
    record.user == user
  end

  def mark_as_very_urgent?
    record.user == user
  end

  def mark_as_urgent?
    record.user == user
  end

  def mark_as_normal?
    record.user == user
  end
end
