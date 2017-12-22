Rails.application.routes.draw do
	resources :users
	resources :recipes
	
	get    '/login' => 'sessions#new'
  	post   '/login' => 'sessions#create'
  	delete '/logout' => 'sessions#destroy'

	get "/sign_up" => "users#new", as: "sign_up"

  root 'home#index'
end
