# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
      alias_action :create, :read, :update, :destroy, to: :crud

      can :read, :all # for guests

      if user.present? # for users
        can :read, :all

        if user.is_admin? # for admin
          can :manage, :all
        elsif user.is_mentor? # for mentor
          can :crud, Course, user_id: user.id
        end

      end
  end
end
####
    #     def initialize(user)
    #     can :read, Listing, public: true
    
    #     if user.present?  # additional permissions for logged in users (they can read their own posts)
    #       can :read, Listing, user_id: user.id
    
    #       if user.admin?  # additional permissions for administrators
    #         can :manage, :all
    #       else
    #         can :read, :all
    #       end #is this enough ends?
    #     end
    #   end
    # end




