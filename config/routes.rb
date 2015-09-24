Rails.application.routes.draw do

	# routes for omniauth log in
	get 'auth/:provider/callback', to: 'sessions#create'
	get 'auth/failure', to: redirect('/')

	# route for log out
	get 'logout', to: 'sessions#destroy', as: 'logout'

	# routes for creating new tweets
	resources :tweets, only: [:new, :create]

	# route for homepage
	root to: 'site#index'

end