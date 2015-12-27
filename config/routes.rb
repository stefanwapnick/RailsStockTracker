Rails.application.routes.draw do

  devise_for :users, :controllers => { :registrations => 'user/registrations' }
  resources :user_stocks, except: [:show, :edit, :update]
  root 'welcome#index'

  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search', to: 'stocks#search'
  get 'my_friends', to: 'users#my_friends'
  get 'search_friends', to: 'users#search'
  post 'add_friend', to: 'users#add_friend'
  delete 'friendships/:id', to: 'friendships#destroy', as: 'friendships'
  get 'users/:id', to: 'users#show', as: 'users'
end
