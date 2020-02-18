# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    can :read, :root
    return unless user

    if user.admin?
      can :manage, :all
    elsif user.sec?
      can :read, User, role: 'professor'
      can :update, User do |usuario|
        usuario.role == 'professor' || usuario.id == user.id
      end
      can :create, User, role: 'professor'
      can :manage, Aluno
      can :manage, Turma
    else
      can :update, User do |usuario|
        usuario.id == user.id
      end
    end

    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
