Rails.application.routes.draw do
  devise_for :users
  resources :alliances
  resources :companies
  resources :employees
  resources :institutions
  resources :projects
  root to: 'projects#index'
end
