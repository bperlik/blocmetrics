Rails.application.routes.draw do

  get 'registered_applications/index'

  get 'registered_applications/show'

  get 'registered_applications/new'

  devise_for :users

  resources :registered_applications

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
