Rails.application.routes.draw do
  root 'search#index'

  get '/404',                to: 'errors#not_found'

  resources :search
end
