WebStore::Application.routes.draw do
  resource :session
  resources :users

  match "/login" => "sessions#new"
  match "/logout" => "sessions#destroy"
  match "/register" => "users#new"
end