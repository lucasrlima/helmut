class SkillPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    is_admin_or_photographer?
  end

  def create?
    is_admin_or_photographer?
  end

  def destroy?
    is_admin_or_photographer?
  end

  def show?
    is_admin_or_photographer?
  end
  
  

  private

  def is_admin?
    user.admin
  end

  def is_admin_or_photographer?
    user.admin || user == record.profile.user 
  end

end
