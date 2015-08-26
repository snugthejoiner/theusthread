Rails.application.routes.draw do
  resources :people

  resources :personal_events

  resources :historical_events, only: [:index]

  get 'users/show'

  devise_for :users
  get 'welcome/index'

  root to: 'welcome#index'

end
