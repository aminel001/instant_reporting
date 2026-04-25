class UserPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    user.admin? || same_company?
  end

  def create?
    return true if user.admin?
    return false unless user.manager?
    same_company? && %w[manager junior].include?(record.role.to_s)
  end

  def new?
    user.admin? || user.manager?
  end

def update?
  return false if record.role_changed? && !user.admin?

  return true if user.admin?
  return true if record == user
  user.manager? && same_company?
end

  def edit?
    update?
  end

  def destroy?
    return false if record == user
    return true if user.admin?
    user.manager? && same_company?
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(company_id: user.company_id)
      end
    end
  end

  private

  def same_company?
    record.company_id == user.company_id
  end
end
