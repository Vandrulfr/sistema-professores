# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  get 'professor/index'
  get 'sec/index'
  get 'home/index'
  get 'admin/index'
  get 'list/index'

  root 'home#index'

  resources :users, except: :create

  post 'create_user' => 'users#create', as: :create_user
end
