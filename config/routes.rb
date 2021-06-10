Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :jobs do
    resources :skills, only: [ :new, :create ]
  end
  resources :profiles
  resources :skills, only: [ :destroy, :index, :show ]
  resources :skills do 
    resources :payments, only: [ :new, :create ]
  end
  
end
