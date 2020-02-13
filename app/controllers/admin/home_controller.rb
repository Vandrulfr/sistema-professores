class Admin::HomeController < ApplicationController

  before_action check_admin
  def index; end

  private

  def check_admin
    redirect_to root_path unless current_user.admin?
  end
end
