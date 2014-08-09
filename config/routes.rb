Rails.application.routes.draw do

#  resources :wikis 
#  resources :collaborators

  #Trying to get route path correct
  resources :wikis do
    resources :collaborations do
    end
  end

  resources :charges

  devise_for :users, :controllers => { :registrations => "registrations" }
  
  resources :users

  get 'about' => 'welcome#about'

  root to: 'welcome#index'

end
