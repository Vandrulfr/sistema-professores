# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  get 'professor/index'
  get 'sec/index'
  get 'admin/home/index'
  get 'home/index'
  root 'home#index'

  resources :users, except: :create

  namespace :admin do
    resources :users
  end

  namespace :sec do
    resources :alunos
    resources :turmas
  end

end
