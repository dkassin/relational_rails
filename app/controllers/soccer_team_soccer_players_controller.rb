class SoccerTeamSoccerPlayersController < ApplicationController
  def index
    @soccer_team = SoccerTeam.find(params[:id])
    @soccer_players = @soccer_team.soccer_players
  end

  def new
  end

  def create
    @soccer_team = SoccerTeam.find(params[:id])
    soccer_player = SoccerPlayer.new({
      name: params[:soccer_players][:name],
      homegrown_player: params[:soccer_players][:homegrown_player],
      games_played: params[:soccer_players][:games_played],
      soccer_teams_id: params[:soccer_players][:soccer_teams_id]
      })

    soccer_player.save
    redirect_to "/soccer_teams/#{@soccer_team.id}/soccer_players"
  end

end
