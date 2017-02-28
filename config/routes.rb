Rails.application.routes.draw do

  resources :users

  post		'/userstats/update_clear' => 'userstats#update_clearstats'
  post		'/userstats/update_score' => 'userstats#update_scorestats'

  get		'/signup' => 'users#new'

  get		'/login' => 'sessions#new'
  post		'/login' => 'sessions#create'
  delete	'/logout' => 'sessions#destroy'

  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
