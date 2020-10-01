Rails.application.routes.draw do
  get 'messages/index'
  get 'kids/index'
  root to: "kids#index"
  resources :kids 
  devise_for :users
  resources :rooms, only: [:index, :new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
