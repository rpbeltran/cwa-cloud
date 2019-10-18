Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root 'story#new'
  get 'story/new'
  root 'story#new'
  
  get 'login', to: 'logins#new'
  get 'login/create', to: 'logins#create', as: :create_login
end
