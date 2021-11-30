Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/soccer_teams', to: 'soccer_teams#index'
  get '/mountain_ranges', to: 'mountain_ranges#index'
  get '/soccer_teams/new', to: 'soccer_teams#new'
  get '/mountain_ranges/new', to: 'mountain_ranges#new'
  post '/soccer_teams', to: 'soccer_teams#create'
  post '/mountain_ranges', to: 'mountain_ranges#create'
  get '/soccer_teams/:id', to: "soccer_teams#show"
  get '/mountain_ranges/:id', to: "mountain_ranges#show"
  get '/soccer_players', to: 'soccer_players#index'
  get '/mountains', to: 'mountains#index'
  get '/soccer_players/new', to: 'soccer_players#new'
  get '/mountains/new', to: 'mountains#new'
  post '/soccer_players', to: 'soccer_players#create'
  post '/mountains', to: 'mountains#create'
  get '/soccer_players/:id', to: "soccer_player#show"
  get '/mountains/:id', to: "mountains#show"

end
