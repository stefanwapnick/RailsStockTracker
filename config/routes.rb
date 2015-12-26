Rails.application.routes.draw do

  root 'welcome#index'

  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search', to: 'stocks#search'
  devise_for :users
end
