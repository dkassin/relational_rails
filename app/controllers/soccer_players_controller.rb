class SoccerPlayersController < ApplicationController
  def initialize
    @soccer_players = SoccerPlayer.homegrown_player_only
  end

  def index
  end

  def new
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

  def destroy
    soccer_player = SoccerPlayer.find(params[:id])
    soccer_player.destroy

    redirect_to "/soccer_players"
  end

  private

  def soccer_player_params
    params.permit(:name, :homegrown_player, :games_played)
  end

end
