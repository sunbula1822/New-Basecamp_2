Rails.application.routes.draw do
  devise_for :users
  resources :messages do
    resources :comments
  end
  resources :comments

  resources :filers
  resources :attaches
  resources :todos

  resources :projects do
  resources :todos
  resources :filers
  resources :messages
  end
  root 'pages#home'
end
