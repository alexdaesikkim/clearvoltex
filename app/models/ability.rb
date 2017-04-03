class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    user ||= User.new
    if user.role? :admin
        can :manage, :all
    elsif user.role? :regular
        #program
        can :manage, User do |current_user|
            puts current_user.id
            puts user.id
            current_user.id == user.id
        end

        can :read, Difficulty
        can :read, User

        can :manage, Userstat do |userstat|
            user_userstats = user.userstats.map(&:id)
            user_userstats.include? userstat.id
        end

        can :manage, Comment do |comment|
            user_comments = user.comments.map(&:id)
            user_comments.include? comment.id
        end
    else
        can :create, User
    end
  end
end