class Ability
  include CanCan::Ability
  def initialize(user)
    if user.admin
      can :manage, :all
    else
      can [:read, :update, :destroy], Project
    end
  end
end