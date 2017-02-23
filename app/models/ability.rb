class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new
    if user.role? :Admin
        can :manage, :all
    elsif user.role? :Regular
        #program
        can :update, User do |current_user|
            current_user.id == user.id
        end

        can :read, User

        can :update, Userstat do |userstat|
            user_userstats = user.userstats.map(&:id)
            user_userstats.include? = userstat.id
        end
    else
        can :create, User
    end
  end
end