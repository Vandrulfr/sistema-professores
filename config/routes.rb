# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  get 'professor/index'
  get 'sec/index'
  get 'home/index'
  get 'list/index'

  root 'home#index'

  resources :users, except: :create

  namespace :admin do
    resources :users, only: %i[index create new]
  end

end
