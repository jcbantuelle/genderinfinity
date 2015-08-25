Rails.application.routes.draw do
  root 'search#new'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/404', to: 'errors#not_found'

  resources :search
  resources :locations
end
