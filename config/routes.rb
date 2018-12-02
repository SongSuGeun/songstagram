Rails.application.routes.draw do
  root 'pictures#index'
  get 'sessions/new'

  resources :sessions, only: [:new, :create, :destroy]
  resources :pictures do 
    collection do 
      post :confirm
      get :list
      post :list
    end 
  end
  
  resources :users, only: [:new, :show, :create, :edit, :confirm, :update] do
    collection do
      post :confirm
    end
  end
  
  resources :favorites, only: [:create, :destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end