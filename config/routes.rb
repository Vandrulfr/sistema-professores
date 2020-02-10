Rails.application.routes.draw do
  get 'professor/index'
  get 'sec/index'
  devise_for :secs
  devise_for :admins
  devise_for :users
  get 'home/index'
  get 'admin/index'
  root "home#index"
end
