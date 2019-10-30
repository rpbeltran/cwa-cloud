Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get 'story/new', to: 'story#new', as: :story_new
  get 'story/create', to: 'story#create', as: :story_create
  root 'story#new'
  
  get 'login', to: 'logins#receive'
  get 'login/create', to: 'logins#create', as: :create_login
end
