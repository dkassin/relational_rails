Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/soccer_teams', to: 'soccer_teams#index'
  get '/mountain_ranges', to: 'mountain_ranges#index'
  get '/soccer_teams/new', to: 'soccer_teams#new'
  get '/mountain_ranges/new', to: 'mountain_ranges#new'
  post '/soccer_teams', to: 'soccer_teams#create'
  post '/mountain_ranges', to: 'mountain_ranges#create'
end
