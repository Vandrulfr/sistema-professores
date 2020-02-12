# frozen_string_literal: true

class Admin::UsersController < ApplicationController
  def index; end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :matricula, :role)
  end
end
