Rails.application.routes.draw do
  get 'privacy_policy', to: 'privacy_policy#index'
  get 'welcome/index'
  root 'welcome#index'
  resources :events do
    member do
      post '/invite', to: 'events#invite_user'
    end
  end
  resources :users do
    member do
      post '/accept_invite', to: 'users#accept_invite'
      post '/going', to: 'users#mark_going'
      post '/gcal', to: 'users#add_to_gcal'
    end
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # Routes for Google authentication
  get 'auth/:provider/callback', to: 'sessions#google_auth'
  get 'auth/failure', to: redirect('/')
end
