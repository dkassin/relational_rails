class SoccerTeamSoccerPlayersController < ApplicationController
  def index
    @soccer_team = SoccerTeam.find(params[:id])
    @soccer_players = @soccer_team.soccer_players
    if params[:sort]
      @soccer_players = @soccer_players.sorted
    elsif params[:games].present?
      @soccer_players = @soccer_players.games_threshold(params[:games])
    else
      @soccer_players
    end
  end

  def new
    @soccer_team = SoccerTeam.find(params[:id])
  end

  def create
    @soccer_team = SoccerTeam.find(params[:id])
    soccer_player = SoccerPlayer.new({
      name: params[:name],
      homegrown_player: params[:homegrown_player],
      games_played: params[:games_played],
      soccer_team_id: @soccer_team.id
      })

    soccer_player.save
    redirect_to "/soccer_teams/#{@soccer_team.id}/soccer_players"
  end

  def destroy

    soccer_player = SoccerPlayer.find(params[:id])
    soccer_player.destroy

    redirect_to "/soccer_players"
  end
end
