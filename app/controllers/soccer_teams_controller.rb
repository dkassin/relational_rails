class SoccerTeamsController < ApplicationController
  def index
    @soccer_teams = SoccerTeam.all
  end

  def new
  end

  def create
    soccer_team = SoccerTeam.new({
      name: params[:soccer_teams][:name],
      qualified_champ_league: params[:soccer_teams][:qualified_champ_league],
      points: params[:soccer_teams][:points]
      })

    soccer_team.save

    redirect_to '/soccer_teams'
  end
  
  def show
  end
end
