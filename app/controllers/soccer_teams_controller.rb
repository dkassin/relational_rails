class SoccerTeamsController < ApplicationController
  def index
    @soccer_teams = SoccerTeam.sort_team
  end

  def new
  end

  def create

    soccer_team = SoccerTeam.create({
      name: params[:name],
      qualified_champ_league: params[:qualified_champ_league],
      points: params[:points]
      })

    soccer_team.save

    redirect_to '/soccer_teams'
  end

  def show
    @soccer_teams = SoccerTeam.find(params[:id])
  end

end
