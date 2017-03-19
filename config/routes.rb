Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }
  root 'homepage#index'
  get '/nearby', to: 'homepage#nearby'
end
