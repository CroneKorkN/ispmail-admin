Rails.application.routes.draw do
  get 'index/index'

  resources :domains
  resources :users
  resources :redirections

  root "index#index"
end
