Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/soccer_teams', to: 'soccer_teams#index'
  get '/soccer_teams/new', to: 'soccer_teams#new'
  post '/soccer_teams', to: 'soccer_teams#create'
  get '/soccer_teams/:id', to: 'soccer_teams#show'
  delete '/soccer_teams/:id', to: 'soccer_teams#destroy'
  get '/soccer_teams/:id/edit', to: 'soccer_teams#edit'


  get '/soccer_teams/:id/soccer_players', to: 'soccer_team_soccer_players#index'
  get '/soccer_teams/:id/soccer_players/new', to: 'soccer_team_soccer_players#new'
  post '/soccer_teams/:id/soccer_players', to: 'soccer_team_soccer_players#create'

  get '/soccer_players', to: 'soccer_players#index'
  get '/soccer_players/new', to: 'soccer_players#new'
  post '/soccer_players', to: 'soccer_players#create'
  get '/soccer_players/:id', to: 'soccer_players#show'
  get '/soccer_players/:id/edit', to: 'soccer_players#edit'
  patch '/soccer_players/:id', to: 'soccer_players#update'


  get '/mountain_ranges', to: 'mountain_ranges#index'
  get '/mountain_ranges/new', to: 'mountain_ranges#new'
  post '/mountain_ranges', to: 'mountain_ranges#create'
  get '/mountain_ranges/:id', to: 'mountain_ranges#show'
  delete '/mountain_ranges/:id', to: 'mountain_ranges#destroy'
  get '/mountain_ranges/:id/edit', to: 'mountain_ranges#edit'
  patch '/mountain_ranges/:id', to: 'mountain_ranges#update'

  get '/mountains', to: 'mountains#index'
  get '/mountains/new', to: 'mountains#new'
  post '/mountains', to: 'mountains#create'
  get '/mountains/:id', to: "mountains#show"
  get '/mountains/:id/edit', to: "mountains#edit"
  patch '/mountains/:id', to: "mountains#update"


  get '/mountain_ranges/:id/mountains', to: 'mountain_range_mountains#index'
  get '/mountain_ranges/:id/mountains/new', to: 'mountain_range_mountains#new'
  post '/mountain_ranges/:id/mountains/', to: 'mountain_range_mountains#create'

end
