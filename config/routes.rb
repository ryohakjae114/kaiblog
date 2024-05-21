Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users
  resource :profile, only: %i[edit update]
  resources :users, only: %i[show]
  scope module: 'users' do
    resources :posts, only: %i[new create edit update destroy]
  end
  resources :relationships, only: %i[create destroy]
  get 'up' => 'rails/health#show', as: :rails_health_check
end
