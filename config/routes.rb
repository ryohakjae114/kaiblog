Rails.application.routes.draw do
  root 'posts#index'
  devise_for :users

  scope module: 'users' do
    resources :users, only: %i[show]
    resource :profile, only: %i[edit update]
    resources :posts, only: %i[new create edit update destroy]
    resources :relationships, only: %i[create destroy]
    resources :following_posts, only: :index
  end
  get 'up' => 'rails/health#show', as: :rails_health_check
end
