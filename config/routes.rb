Rails.application.routes.draw do

  resources :user_stocks, except: [:show, :edit, :update]
  root 'welcome#index'

  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search', to: 'stocks#search'
  devise_for :users, :controllers => { :registrations => 'user/registrations' }
end
