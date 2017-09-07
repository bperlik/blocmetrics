Rails.application.routes.draw do

  namespace :api do
  get 'events/create'
  end

  namespace :api do
  get 'event/create'
  end

  devise_for :users

  resources :registered_applications

  get 'about' => 'welcome#about'

  root 'welcome#index'

  #namespace keeps the API separated from other app routes
  namespace :api, defaults: { format: :json } do
    #our API only needs to support one route to record new events
    resources :events, only:[:create]
  end

  # To implement CORS, use option request to check if route accepts a COR
  # and then define preflight option to return a 200 in events controller
  match '/events', to: 'events#preflight', via: [:options]
  resources :events, only:[:create]

end
