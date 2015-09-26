require 'subdomain'
Rails.application.routes.draw do
  devise_for :owners
  resources :owners, only: [:index, :show]
  resources :sites
  constraints(Subdomain) do
    get '/' => 'sites#welcome'
    resources :posts
    resources :users, only: [:new, :create]
  end
  root 'pages#home'
end
