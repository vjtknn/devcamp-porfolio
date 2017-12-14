Rails.application.routes.draw do
  resources :portfolios
  get 'pages/about'

  get 'pages/contact'

  root 'pages#home'
  
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
