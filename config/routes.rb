Rails.application.routes.draw do
  resources :recipes, only: [:show, :new] do
    resources :ratings, only: [:new, :create]
  end
  
  resources :tags
  resources :ratings
  resources :recipes
  resources :users
  resources :sessions

  get '/auth/facebook/callback' => 'sessions#create'
  get '/logout' => 'users#destroy'
  # get '/rating/:id/new' => 'ratings#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
