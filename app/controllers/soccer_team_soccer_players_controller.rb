class SoccerTeamSoccerPlayersController < ApplicationController
  def index
    @soccer_team = SoccerTeam.find(params[:id])
    @soccer_players = @soccer_team.soccer_players
  end
end
