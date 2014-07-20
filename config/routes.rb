Rails.application.routes.draw do
 
  get 'users/index'

  get 'blocipedia/index'

  devise_for :users
    resources :users, only: [:update]

  get 'welcome/index'

  get 'welcome/about'

  root to: 'welcome#index'

  resources :charges

 end
