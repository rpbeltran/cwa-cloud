Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#main'
 
  get 'home', to: 'home#main'
  get 'home/new', to: 'home#new'
  
  resources :stories
  get 'story', to: 'story#index', as: :story_index
  get 'story/new', to: 'story#new', as: :story_new
  post 'story/create', to: 'story#create', as: :story_create
 
  get 'admin', to: 'administer#main'
  get 'admin/new', to: 'administer#new'
  
  get 'rules', to: 'rules#main'
  get 'rules/update', to: 'rules#update'
  
  #get 'tags/:tag', to: 'posts#index', as: :tag
  
  get 'login', to: 'logins#receive'
  get 'login/create', to: 'logins#create', as: :create_login
  get 'login/out', to: 'logins#logout'
  
end
