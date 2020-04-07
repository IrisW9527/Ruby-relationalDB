class Ability
  include CanCan::Ability

  def initialize(user)
    # can :read, Photo, public: true

    if user.is? :current_user
      can :manage, :all
    else
      can :read, Photo
    end
  end

end