class HomeController < ApplicationController
  def index
    return unless user_signed_in?

    redirect_to admin_users_path if current_user.role == 'admin'
    redirect_to sec_index_url       if current_user.role == 'sec'
    redirect_to professor_index_url if current_user.role == 'professor'
  end
end
