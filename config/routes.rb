Rails.application.routes.draw do
  devise_for :users
  root "books#top"
  get "about" => "books#about"
  get "user_info/:id" => "users#info"
  resources :books
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
