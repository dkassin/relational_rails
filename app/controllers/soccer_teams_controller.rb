class SoccerTeamsController < ApplicationController
  def index
    @soccer_teams = SoccerTeams.all
  end

  def new
  end

  def create
    soccer_team = SoccerTeams.new({
      name: params[:soccer_teams][:name],
      qualified_champ_league: params[:soccer_teams][:qualified_champ_league],
      points: params[:soccer_teams][:points]
      })

    soccer_team.save

    redirect_to '/soccer_teams'
  end

  def show
    @soccer_teams = SoccerTeams.find(params[:id])
  end
end
