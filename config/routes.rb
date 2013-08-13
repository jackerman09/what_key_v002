SampleApp::Application.routes.draw do
  get "chordnotes/create"
  get "chordnotes/destroy"
  get "noteinchords/create"
  get "noteinchords/destroy"
  resources :users do
    # member do
    #   get :following, :followers
    # end
  end
  resources :sessions,    only: [:new, :create, :destroy]
  resources :keys,        only: [:index, :show, :new, :destroy, :create]
  resources :chords,      only: [:index, :show, :new, :destroy, :create]
  resources :notes,       only: [:index, :show, :new, :destroy, :create]
  resources :chordnotes,  only: [:new, :destroy, :create]

  root to: 'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
end
