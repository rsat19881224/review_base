Rails.application.routes.draw do
  resources :reviews
  resources :schools
	devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
	root  'pages#index'
	get 'pages/show'
end
