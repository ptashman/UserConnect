Rails.application.routes.draw do
  devise_for :owners
  resources :owners
  resources :sites
  constraints(Subdomain) do
    get '/' => 'sites#welcome'
    devise_for :users
    resources :posts
    resources :users
  end
  root 'pages#home'
end
