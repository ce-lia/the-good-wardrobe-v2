Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  resources :products do
    resources :proportions, only: [:new, :create]
  end
  resources :proportions, only: [:destroy]
  get 'statistics', to: 'pages#statistics'
end
