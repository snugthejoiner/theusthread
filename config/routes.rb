Rails.application.routes.draw do
  resources :personal_events

  get 'historical_events/index'

  devise_for :users
  get 'welcome/index'

  root to: 'welcome#index'

end
