class SoccerPlayersController < ApplicationController
  def index
    @soccer_players = SoccerPlayer.all
  end

  def new
  end

  def create

    soccer_player = SoccerPlayer.new({
      name: params[:name],
      homegrown_player: params[:homegrown_player],
      games_played: params[:games_played],
      soccer_teams_id: params[:soccer_team_id]
      })

    soccer_player.save
    redirect_to '/soccer_players'
  end

  def show
    @soccer_player = SoccerPlayer.find(params[:id])
  end

  def edit
    @soccer_player = SoccerPlayer.find(params[:id])
  end

  def update
    soccer_player = SoccerPlayer.find(params[:id])
    soccer_player.update(soccer_player_params)
    redirect_to "/soccer_players/#{soccer_player.id}"
  end

  private

  def soccer_player_params
    params.permit(:name, :homegrown_player, :games_played)
  end

end
