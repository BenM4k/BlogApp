Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts do
      resources :comments
      resources :likes, only: [:create]
    end
  end

  # Defines the root path route ("/")
  root "home#index"
end
