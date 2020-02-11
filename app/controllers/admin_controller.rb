class AdminController < ApplicationController
  def index; end

  def new
    @user = User.new
  end

  def create_user
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user
      #else
      #render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :matricula, :role)
  end
end
