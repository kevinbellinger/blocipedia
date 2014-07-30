Rails.application.routes.draw do
  
resources :wikis do
    resources :collaborators, only: [:create, :destroy]
  end

resources :charges
devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

 end
