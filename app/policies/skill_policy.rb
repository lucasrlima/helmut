class SkillPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    is_admin?
  end

  def create?
    is_admin?
  end

  private

  def is_admin?
    user.admin
  end

end
