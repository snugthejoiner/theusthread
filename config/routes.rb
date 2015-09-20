Rails.application.routes.draw do
  resources :people, except: [:index]

  resources :personal_events

  resources :historical_events, only: [:index]

  resource :tags

  get 'users/show'

  delete 'remove_personal_event' => 'personal_events#destroy'

  delete 'remove_person' => 'people#destroy'

  devise_for :users
  get 'welcome/index'

  root to: 'welcome#index'

end
