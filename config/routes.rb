Rails.application.routes.draw do
  # resources :vehicles, except: [:show]

  root to: "vehicles#index"

  get '/start', to: 'main#start_data'

  get '/clear', to: 'main#clear_data'

  post '/vehicles', to: 'main#vehicle_registration'
  post '/vehicles/:id/locations', to: 'main#vehicle_location_update'
  delete '/vehicles', to: 'main#vehicle_deregistration'

  mount ActionCable.server => '/cable'
end
