Rails.application.routes.draw do

  resources :stats, only: :index
  resources :webhooks, only: :create
  root 'stats#index'
  post '/' => 'webhooks#create'

end
