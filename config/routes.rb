Rails.application.routes.draw do

  #devise routes
  devise_for :users, path: '',
              path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register'}

  #routes for pages
  root to: 'pages#home'
  get '/about-me', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'

  #portfolios routes
  resources :portfolios, except: [:show] do
    put :sort, on: :collection
  end
  get 'react-items', to: 'portfolios#react_portfolio'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  #posts routes inc. action cable for post-comments
  resources :posts do
    member do
      get :toggle_status
    end
  end

  mount ActionCable.server => '/cable'

  #routes for topics
  resources :topics, only: [:index, :show]

end
