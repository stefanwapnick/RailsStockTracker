Rails.application.routes.draw do

  resources :user_stocks
  root 'welcome#index'

  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search', to: 'stocks#search'
  devise_for :users
end
