Rails.application.routes.draw do

  # devise_for :users
  devise_for :users, controllers: { registrations: "registrations" }
  
  get 'profiles', to: 'profiles#index'
  # get 'profiles/:id/edit', to: 'profiles#edit'
  # get 'profiles/:id', to: 'profiles#update'
  # resources :profiles, only: [:index, :edit, :new]
  
  # resources :sessions, only: [:new, :create, :destroy]
  # get '/login' => 'sessions#new', as: 'login'
  # delete '/logout' => 'sessions#destroy', as: 'logout'

  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'

  # get 'groups/index'
  # get 'groups/show'

  resources :photos do
  	resources :comments, only: [:create, :destroy]
  end


  namespace :api, defaults: {format: 'json'} do
    resources :sessions, only: [:create]
    resources :users, only: [ :show,:create,:update]
    patch 'users', to: 'users#update'
    get 'profiles/:user_id', to: 'profiles#show'
    get 'photos/search', to: 'photos#search'
    resources :photos, only: [:index, :show, :search, :create], include: :comments
  end

  
  resources :groups

  root to: "photos#index"
  # root to: "devise/sessions#new"
  # match '/user' => "photos#index", :as => :user_root

end
