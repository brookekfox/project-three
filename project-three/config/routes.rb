Rails.application.routes.draw do

	resources :users, :recommendations
	get 'recommendations/public/:id' => 'recommendations#public', as: 'public_recommendations'

	resource :sessions, only: [:new, :create, :destroy]

	namespace :api do
		resources :users
	end

  root 'sessions#new'

end