Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get  "home/about"  => "homes#show"
  resources :users, only: [:index,:show, :edit,:update]
  resource :relationships, only: [:create, :destroy]
  get 'followings/:id' => 'relationships#followings', as: 'followings'
  get 'followers/:id' => 'relationships#followers', as: 'followers'

  resources :books do
    resource :favorites, only: [:create,:destroy]
    resources :comments, only: [:create, :destroy]
  end
end
