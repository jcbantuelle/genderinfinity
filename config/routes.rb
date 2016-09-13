Rails.application.routes.draw do
  root 'home#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/404', to: 'errors#not_found'

  resources :search
  resources :locations do
    collection do
      get :thank_you
    end
  end
  resources :specialties
end
