# frozen_string_literal: true

class Admin::UsersController < ApplicationController

  load_and_authorize_resource :user, parent: false

  def index; end

  def new; end

  def edit; end

  def create
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path unless @user.role == 'professor'
      redirect_to root_path if @user.role == 'professor'
    else
      render 'admin/users/edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :matricula, :role)
  end
end
