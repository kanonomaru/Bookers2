Rails.application.routes.draw do
  resources :books, only: [:new, :index, :show]
  root to: "homes#top"
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
