Rails.application.routes.draw do
  root 'home#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/404', to: 'errors#not_found'

  resources :search do
    collection do
      post 'specialties'
    end
  end

  resources :locations
end
