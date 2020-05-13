Rails.application.routes.draw do
  get 'accounts/new'
  root to: 'users#new'
  post 'users' => 'users#create'
  get 'users/new' => 'users#new', as: :new_user
  get '/login'     => 'sessions#new'   # log in page with form:
  post '/login'    => 'sessions#create'   # create (post) action for when log in form is submitted:
  delete '/logout' => 'sessions#destroy'
  get "accounts/new" => "accounts#new", :as => "my_account"
  post "accounts/new" => "accounts#create", :as => "update_account"
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login'  => 'admins#new'
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :accounts
end
