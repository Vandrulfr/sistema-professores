class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to admin_index_url     if current_user.role == 'admin'
      redirect_to sec_index_url       if current_user.role == 'sec'
      redirect_to professor_index_url if current_user.role == 'professor'
    end
  end
end
