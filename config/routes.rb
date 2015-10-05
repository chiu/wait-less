Rails.application.routes.draw do
  get 'projects/index'

  get 'projects/show'

  get 'projects/new'

  get 'projects/edit'

  root to: 'visitors#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # devise_for :users

  resources :users
end
