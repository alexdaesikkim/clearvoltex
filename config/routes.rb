Rails.application.routes.draw do
  resources :songs
  resources :difficulties
  resources :userstats
  resources :users

  post '/userstats/update' => 'userstats#update_clearstats'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
