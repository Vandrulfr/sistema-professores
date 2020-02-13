class HomeController < ApplicationController
  before_action :redirect_home

  def index; end

  private

  def redirect_home
    return unless user_signed_in?

    redirect_to admin_home_index_path if current_user.role == 'admin'
    redirect_to sec_index_url         if current_user.role == 'sec'
    redirect_to professor_index_url   if current_user.role == 'professor'
  end
end
