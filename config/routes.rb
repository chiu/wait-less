Rails.application.routes.draw do
  # get 'appointments/index'

  # get 'appointments/show'

  # get 'appointments/new'

  # get 'appointments/edit'

  # get 'projects/index'

  # get 'projects/show'

  # get 'projects/new'

  # get 'projects/edit'

  # get 'api/appointments/'
   # get '/api/diners', :to => 'diners#display_api'
  get '/api/appointments', :to => 'appointments#display_api'
  post '/api/appointments/cor', :to => 'appointments#handle_cor'
  get "/api/appointments/num/:clinic_id", :to => "appointments#get_num"


  root to: 'visitors#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  # devise_for :users

  resources :users

  resources :projects

  resources :appointments
end
