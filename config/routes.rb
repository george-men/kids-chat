Rails.application.routes.draw do
  get 'messages/index'
  get 'kids/index'
  root to: "kids#index"
  resources :users
  resources :kids do
    resources :rooms, only: [:new, :create, :destroy] do
      resources :messages, only: [:index, :create]
    end
  end
end
