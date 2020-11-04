# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    @user ||= user || User.new

    default
    signed_in if @user.persisted?
  end

  def default
    cannot :manage, Referee
    cannot :create, EditionApply
  end

  def signed_in
    can :manage, Referee
    can :manage, EditionApply
  end
end
