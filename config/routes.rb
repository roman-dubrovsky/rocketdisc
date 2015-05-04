Rails.application.routes.draw do
  devise_for :users

  root 'pages#main'

  get 'home', to: 'contents#index', as: :home
  get 'home/:file', to: 'contents#download', as: :download
end
