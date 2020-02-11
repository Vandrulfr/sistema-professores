# frozen_string_literal: true

# lista de usuarios
class ListController < ApplicationController
  def index
    @users = User.all
  end
end
