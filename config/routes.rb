Rails.application.routes.draw do

  resources :user_stocks, except: [:show, :edit, :update]
  resources :users, only: [:show]
  resource :friendships
  root 'welcome#index'

  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search', to: 'stocks#search'
  get 'my_frields', to: 'users#my_friends'
  get 'search_friends', to: 'users#search'
  post 'add_friend', to: 'users#add_friend'

  devise_for :users, :controllers => { :registrations => 'user/registrations' }
end
