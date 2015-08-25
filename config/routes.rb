Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'search#index'

  get '/404',                to: 'errors#not_found'

  resources :search
end
