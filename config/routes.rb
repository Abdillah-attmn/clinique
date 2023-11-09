Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pages#home"
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  resources :doctors do
    resources :appointments, only: %i[index new]
  end

  resources :patients do
    resources :doctors, only: :index
    resources :appointments, only: %i[index new]
  end
end
