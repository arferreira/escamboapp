Rails.application.routes.draw do

  get 'backoffice', to: 'backoffice/dashboard#index'

  namespace :backoffice do
  get 'dashboard', to: 'dashboard#index'
  resources :categories, except: [:show, :destroy]
  resources :admins, except: [:show, :destroy]
  end

  namespace :site do
  get 'home', to: 'home#index'
  end

  devise_for :admins, skip: [:registrations]
  devise_for :members


  root 'site/home#index'

end
