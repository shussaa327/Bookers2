Rails.application.routes.draw do
  devise_for :users
  root "books#top"
  get "about" => "books#about"
  resources :books
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
