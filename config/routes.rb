Rails.application.routes.draw do
  root 'pictures#index'
  get 'sessions/new'
  
  
  
  resources :users, only: [:new, :show, :create]
  
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :pictures do 
    collection do 
      post :confirm
      get :list
      post :list
    end 
  end
  
  resources :favorites, only: [:create, :destroy]
  
  
end