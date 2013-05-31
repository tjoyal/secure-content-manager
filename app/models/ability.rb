class Ability
  include CanCan::Ability

  def initialize(user)

    if user && user.admin?
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard                  # allow access to dashboard
    end

    if user && user.admin?
      can :manage, [Group, Server]
    else
      can :read, Group, :user_groups => {:user_id => user.id, :read => true}

      can :read,   Server, :group => { :user_groups => { :user_id => user.id, :read => true } }
      can :update, Server, :group => { :user_groups => { :user_id => user.id, :edit => true } }
      can :manage, Server, :group => { :user_groups => { :user_id => user.id, :manage => true } }
    end

  end
end
