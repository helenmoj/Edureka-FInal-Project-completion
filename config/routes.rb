Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
# get 'password_resets/new'
  #get 'users/new'
  # get 'users/new' => 'users#new', as: :new_user # sign up page with form
  root to: 'users#new'
# create (post) action for when sign up form is submitted:
  post 'users' => 'users#create'
  #post 'admins' => 'admins#create'
  get 'users/new' => 'users#new', as: :new_user
  #get 'admins/new' => 'admins#new', as: :new_admin
  get '/login'     => 'sessions#new'   # log in page with form:
  post '/login'    => 'sessions#create'   # create (post) action for when log in form is submitted:
  delete '/logout' => 'sessions#destroy'
 # get 'save'  => 'admins#new'
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login'  => 'admins#new'
  resources :users, :admins
  resources :password_resets,     only: [:new, :create, :edit, :update]
end
