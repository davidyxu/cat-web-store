WebStore::Application.routes.draw do
  resource :session
  resources :users
  resource :cart, :only => ['show', 'update']
  resource :order, :only => ['create', 'show']
  resources :products do
      match "/cart/add" => "carts#add", :via => :get
      match "/cart/remove" => "carts#remove", :via => :get
  end

  match "/login" => "sessions#new"
  match "/logout" => "sessions#destroy"
  match "/register" => "users#new"
end