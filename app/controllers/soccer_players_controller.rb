class SoccerPlayersController < ApplicationController
  def index
    @soccer_players = SoccerPlayer.all
  end

  def new
  end

  def create
    soccer_player = SoccerPlayer.new({
      name: params[:soccer_players][:name],
      homegrown_player: params[:soccer_players][:homegrown_player],
      games_played: params[:soccer_players][:games_played]
      })

    soccer_player.save

    redirect_to '/soccer_players'
  end
end
