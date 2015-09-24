Rails.application.routes.draw do

  # used to implement omniauth login
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
 
  # routes for application
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :tweets, only: [:new, :create]
 
  # set root of app
  root to: 'site#index'

end