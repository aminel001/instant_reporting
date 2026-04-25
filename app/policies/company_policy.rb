class CompanyPolicy < ApplicationPolicy
  def index?
    user.admin?
  end

  def show?
    user.admin? || record.id == user.company_id
  end

  def create?
    user.admin?
  end

  def new?
    create?
  end

  def update?
    user.admin? || (user.manager? && record.id == user.company_id)
  end

  def edit?
    update?
  end

  def destroy?
    user.admin?
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(id: user.company_id)
      end
    end
  end
end
