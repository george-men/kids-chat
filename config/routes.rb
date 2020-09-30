Rails.application.routes.draw do
  get 'kids/index'
  root to: "kids#index"
  resources :kids
end
