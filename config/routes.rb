Rails.application.routes.draw do

  root to: 'pages#home'

  resources :portfolios

  get '/about-me', to: 'pages#about'

  get '/contact', to: 'pages#contact'

  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
