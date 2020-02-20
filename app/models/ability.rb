# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
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
  end
end
