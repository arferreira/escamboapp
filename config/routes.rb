Rails.application.routes.draw do

  get 'backend', to: 'backoffice/dashboard#index'

  namespace :backoffice do
  get 'dashboard', to: 'dashboard#index'
  resources :categories, except: [:show, :destroy]
  end

  namespace :site do
  get 'home', to: 'home#index'
  end

  devise_for :admins
  devise_for :members


  root 'site/home#index'

end
