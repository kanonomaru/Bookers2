Rails.application.routes.draw do
  get "homes/about" => "homes#about"
  get 'users/show'
  get 'users/edit'
  get 'users/index'
  post 'books' => "books#create"
  resources :books, only: [:new, :index, :show]
  root to: "homes#top"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
