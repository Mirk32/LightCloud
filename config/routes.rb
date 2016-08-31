LightCloud::Application.routes.draw do

  resources :sessions
  resources :messages

  root 'messages#index'

  match '/login', to: 'sessions#index', via: 'get'

  match 'auth/:provider/callback', to: 'sessions#create', via: 'get'

  match '/sign_out', to: 'sessions#destroy', via: 'delete'

  get '/messages/new/(:parent_id)', to: 'messages#new', as: :parent_id

end
