Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root 'story#new'
  get 'story/new'
  root 'story#new'
 
  get 'rules', to: 'rules#main'
  get 'rules/new', to: 'rules#new'
  
  get 'login', to: 'logins#receive'
  get 'login/create', to: 'logins#create', as: :create_login
end
