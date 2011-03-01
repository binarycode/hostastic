class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.new_record?
      can [:show, :create, :update], Ticket
    else
      can :manage, :all
    end
  end
end
