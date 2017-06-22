Rails.application.routes.draw do
  get '/lenses/search', to: 'lenses#search'
  get 'error_lenses', to: 'lenses#error_message'
  get 'error_bookings', to: 'pages#error_message'
  resources :lenses do
      resources :bookings
  end

  get 'dashboard', to: 'pages#dashboard'

  resources :bookings, only: [:show]
  mount Attachinary::Engine => "/attachinary"

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end



