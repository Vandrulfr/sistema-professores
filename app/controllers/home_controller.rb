class HomeController < ApplicationController
  def index
    redirect_to admin_index_url     if admin_signed_in?
    redirect_to sec_index_url       if sec_signed_in?
    redirect_to professor_index_url if user_signed_in?
  end
end
