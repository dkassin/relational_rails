class SoccerTeamsController < ApplicationController
  def index
    @soccer_teams = ['Soccer Team 1', 'Soccer Team 2', 'Soccer Team 3']
  end

  def new
  end

  def create
  end
end
