class Ability
  include CanCan::Ability

  def initialize(user)

    if user && user.admin?
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard                  # allow access to dashboard
    end

    if user && user.admin?
      #can :manage, [Project, ArtifactType, User]
    else
      #can :read, Project, :user_projects => { :id => user.user_project_ids }

      #can :read, ArtifactType do |artifact_type|
      #  can :read, artifact_type.project
      #end
    end

  end
end
