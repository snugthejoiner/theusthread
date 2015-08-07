Rails.application.routes.draw do
  get 'historical_events/index'

  devise_for :users
  get 'welcome/index'

  root to: 'welcome#index'

end
