Rails.application.routes.draw do
  
resources :wikis 

resources :collaborators

resources :charges
devise_for :users, :controllers => { :registrations => "registrations" }
  
resources :users

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

 end
