Rails.application.routes.draw do
  #root 'stocks#index' 
  root 'watchlists#index'
  resources :watchlists
  resources :sessions, only: [:new, :create, :destroy]  
  get 'signup', to: 'users#new', as: 'signup'  
  get 'login', to: 'sessions#new', as: 'login'  
  get 'logout', to: 'sessions#destroy', as: 'logout'  
  resources :users  

  get 'stocks/index'  
  
  resources :stocks do
    collection do
      get :search
    end
  end
  resources :nse , :controller => 'stocks', type: 'NSE' 
  resources :bse , :controller => 'stocks', type: 'BSE' 
  resources :nse_stocks, controller: 'stocks', type: 'NSE' 
  resources :bse_stocks, controller: 'stocks', type: 'BSE' 

  post 'add_to_watchlist',  to: 'stocks#add_to_watchlist'


#  post 'stocks/:id/add_to_watchlist', to: 'stocks/add_to_watchlist' 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
