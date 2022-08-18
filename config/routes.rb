Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  root to: "messages#index"
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create]
  # ルートパスへのアクセスがあったら、messages_controllerのindexアクションが呼び出される
end
