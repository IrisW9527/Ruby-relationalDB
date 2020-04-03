Rails.application.routes.draw do


  resources :sessions, only: [:new, :create, :destroy]

  get '/login' => 'sessions#new', as: 'login'
  delete '/logout' => 'sessions#destroy', as: 'logout'

  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'

  get 'profiles/index'
  get 'profiles/show'

  get 'groups/index'
  get 'groups/show'


  resources :photos do
  	resources :comments, only: [:create, :destroy]
  end


  root to: "photos#index"

end
