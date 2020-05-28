Rails.application.routes.draw do
  devise_for :users
  # authenticated :user do
  #   root 'users#show', as: :user_root
  # end
  root 'home#top'
  get 'home/about' => 'home#about'
  resources :users, only: [:index, :show, :edit, :update] 
  resources :books, only: [:index, :show, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
