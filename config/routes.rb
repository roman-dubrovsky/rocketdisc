Rails.application.routes.draw do
  devise_for :users

  root 'pages#main'

  ['home', 'home/:folder'].each do |path|
    resources :contents, path: path, only: [:index, :show, :create, :destroy] do
      member do
        patch :proppatch
      end
      collection do
        post :mkcol
      end
    end
  end
end
