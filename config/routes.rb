Rails.application.routes.draw do
  devise_for :users

  root 'pages#main'

  resources :contents, path: 'home', except: [:edit, :new]
end
