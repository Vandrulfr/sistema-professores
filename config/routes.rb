Rails.application.routes.draw do
  devise_for :secs
  devise_for :admins
  get 'home/index'
  devise_for :users

  root "home#index"
end
