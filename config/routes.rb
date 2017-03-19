Rails.application.routes.draw do
  get 'trip_matches/accept'

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
  root 'homepage#index'
  get 'import_vehicles' => 'moji_vehicles#add_vehicles'
  get 'get_matches' => 'trips#trip_matches'
  get 'accept_match' => 'trip_matches#accept'

  resources :moji_vehicles

  get '/nearby', to: 'homepage#nearby'
  get '/stats',   to: 'homepage#stats'
end
