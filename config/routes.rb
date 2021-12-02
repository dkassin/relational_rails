Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/soccer_teams', to: 'soccer_teams#index'
  get '/soccer_teams/new', to: 'soccer_teams#new'
  post '/soccer_teams', to: 'soccer_teams#create'
  get '/soccer_teams/:id', to: 'soccer_teams#show'
  get '/soccer_teams/:id/soccer_players', to: 'soccer_team_soccer_players#index'

  get '/soccer_players', to: 'soccer_players#index'
  get '/soccer_players/new', to: 'soccer_players#new'
  post '/soccer_players', to: 'soccer_players#create'
  get '/soccer_players/:id', to: 'soccer_players#show'

  get '/mountain_ranges', to: 'mountain_ranges#index'
  get '/mountain_ranges/new', to: 'mountain_ranges#new'
  post '/mountain_ranges', to: 'mountain_ranges#create'
  get '/mountain_ranges/:id', to: 'mountain_ranges#show'
  get '/mountain_ranges/:id/mountains', to: 'mountain_range_mountains#index'

  get '/mountains', to: 'mountains#index'
  get '/mountains/new', to: 'mountains#new'
  post '/mountains', to: 'mountains#create'
  get '/mountains/:id', to: "mountains#show"

end
