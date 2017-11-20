Rails.application.routes.draw do
  resources :vehicles, except: [:show]

  root to: "vehicles#index"
end
