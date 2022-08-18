Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  root to: "messages#index"
  resources :users, only: [:edit, :update]
  # ルートパスへのアクセスがあったら、messages_controllerのindexアクションが呼び出される
end
