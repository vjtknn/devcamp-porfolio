Rails.application.routes.draw do

  devise_for :users, path: '',
              path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
  root to: 'pages#home'

  get '/about-me', to: 'pages#about'

  get '/contact', to: 'pages#contact'

  resources :portfolios, except: [:show]
  get 'react-items', to: 'portfolios#react_portfolio'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  resources :posts do
    member do
      get :toggle_status
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
