Rails.application.routes.draw do
  devise_for :users
  get "/home/about" => "home#about"
  post 'books' => "books#create"
  resources :books, only: [:new, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :edit, :index, :update]
  root to: "home#top"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
