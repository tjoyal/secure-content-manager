class Ability
  include CanCan::Ability

  def initialize(user)

    if user && user.admin?
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard                  # allow access to dashboard
    end

    if user && user.admin?
      can :manage, [Group, Server, User]
      can :show, :group_settings
    else
      can :read, Group, :user_groups => {:user_id => user.id, :read => true}
      can :update, Group, :user_groups => {:user_id => user.id, :manage => true}

      can :read,   Server, :group => { :user_groups => { :user_id => user.id, :read => true } }
      can :update, Server, :group => { :user_groups => { :user_id => user.id, :edit => true } }
      can :manage, Server, :group => { :user_groups => { :user_id => user.id, :manage => true } }

      can :show, :group_settings do
        user.user_groups.any? do |user_group|
          user_group.manage
        end
      end
    end

  end
end
