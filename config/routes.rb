Rails.application.routes.draw do
  resources :messages, only: %w(create new index)
  resources :taverns
  devise_scope :user do
    get "users", to: "devise/sessions#new"
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end

