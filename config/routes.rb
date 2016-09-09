Rails.application.routes.draw do
  # get 'bike/show'

  # get 'bike/new'

  # get 'bike/create'

  # get 'bike/edit'

  # get 'bike/update'

  # get 'bike/delete'

  # get 'bike/destroy'

  resources :bike

  # get 'user/index'

  # get 'user/create'

  # get 'user/edit'

  # get 'user/update'

  # get 'user/new'

  # get 'user/destroy'

  # get 'user/show'

  root 'home#index'

  resources :user

  get "login" => "sessions#new"

  post "login" => "sessions#create"
  
  get "logout" => "sessions#destroy"

  get "about" => "home#about"

  get "chris" => "home#chris"

  get "zoe" => "home#zoe"

  get "kemal" => "home#kemal"

  get "jackson" => "home#jackson"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
