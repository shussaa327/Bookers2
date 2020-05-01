Rails.application.routes.draw do
  root "books#top"
  get "/home/about" => "books#about"
  devise_for :users
  devise_scope :user do
    post "users/guest_sign_in" => "users/sessions#new_guest"
  end
  resources :books
  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
