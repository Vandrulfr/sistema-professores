# frozen_string_literal: true

# app/models/user.rb

# classe de usuarios do devise
class User < ApplicationRecord
  attr_accessor :login
  before_create :set_default_role

  # "getter"
  # def login
  #   @login
  # end

  # "setter"
  # def login=(str)
  #  @login = str
  # end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  def self.find_for_database_authentication warden_condition
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      ['matricula = :value ',
       { value: login.strip.downcase }]
    ).first
  end

  validates_uniqueness_of :email
  validates_uniqueness_of :matricula, on: :create
  validates_presence_of :name

  def admin?
    return true unless role != admin

    false
  end

  private

  def set_default_role
    self.role ||= 'Professor'
  end
end