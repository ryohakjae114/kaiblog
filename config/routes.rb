Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  resource :profile, only: %i[edit update]
  resources :posts, only: %i[new create edit update destroy]
  get 'up' => 'rails/health#show', as: :rails_health_check
end
