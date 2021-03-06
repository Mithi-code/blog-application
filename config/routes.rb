Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users
  resources :users, only: %i[index show] do
    resources :posts, only: %i[show index create new] do
      resources :comments, only: %i[create new]
      resources :likes, only: %i[create]
      end 
  end  
  root 'users#index'
  namespace :api do
    resources :users, only: %i[index show] do
      resources :posts, only: %i[index] do
        resources :comments, only: %i[index create]
      end
    end
  end
end