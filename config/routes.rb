Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/soccer_teams', to: 'soccer_teams#index'
  get '/mountain_ranges', to: 'mountain_ranges#index'
end
