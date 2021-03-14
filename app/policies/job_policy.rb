class JobPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      #scope ==> Job
      #seria scope.where(user: user) para liberar apenas instâncias do usuário
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
    is_owner?
  end

  def edit?
    is_owner?
  end

  def update?
    is_owner?
  end

  def destroy?
    is_owner?
  end

  private

  def is_owner?
    record.user == user
  end

end
