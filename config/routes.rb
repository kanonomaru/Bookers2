Rails.application.routes.draw do
  devise_for :users
  get "homes/about" => "homes#about"
  get 'users/index'
  post 'books' => "books#create"
  resources :books, only: [:new, :index, :show, :destroy, :edit]
  resources :users, only: [:show, :edit, :index, :update]
  root to: "homes#top"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
