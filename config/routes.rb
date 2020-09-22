Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  resources :users
  root to: "items#index"
  resources :items do
    collection do
      get 'search'
    end
    resources :orders, only:[:index, :create]
  end
end
