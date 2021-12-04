class SoccerPlayersController < ApplicationController
  def index
    @soccer_players = SoccerPlayer.all
  end

  def new
  end

  def create
    binding.pry


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
    @soccer_players = SoccerPlayer.find(params[:id])
  end

end
