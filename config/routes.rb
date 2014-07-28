Rails.application.routes.draw do
 

resources :wikis
resources :charges
devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users, only: [:update]

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

 end
