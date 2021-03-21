class JobPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      #scope ==> Job
      #seria scope.where(user: user) para liberar apenas instâncias do usuário atual
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    is_owner_or_admin?
  end

  def edit?
    is_owner_or_admin?
  end

  def update?
    is_owner_or_admin?
  end

  def destroy?
    is_owner_or_admin?
  end

  private

  def is_owner_or_admin?
    record.user == user || user.admin
  end

end
