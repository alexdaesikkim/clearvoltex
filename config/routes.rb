Rails.application.routes.draw do
  get 'sessions/new'

  resources :songs
  resources :difficulties
  resources :userstats
  resources :users

  post		'/userstats/update' => 'userstats#update_clearstats'

  get		'/signup' => 'users#new'

  get		'/login' => 'sessions#new'
  post		'/login' => 'sessions#create'
  delete	'/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
