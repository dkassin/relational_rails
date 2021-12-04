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

  def edit
    @soccer_teams = SoccerTeam.find(params[:id])
  end

  def update
    soccer_teams = SoccerTeam.find(params[:id])
    soccer_teams.update({
      name: params[:name],
      qualified_champ_league: params[:qualified_champ_league],
      points: params[:points]
      })

    soccer_teams.save

    redirect_to "/soccer_teams/#{soccer_teams.id}"
  end

end
