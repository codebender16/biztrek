# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
      alias_action :create, :read, :update, :destroy, to: :crud
      can :read, :all # for guests
      if user.present? # for users
        can :read, :all
        if user.is_mentor? # for mentor
          can :crud, Course, user_id: user.id
        end
        if user.is_admin? # for admin
          can :manage, :all
        end
      end


  end
end
