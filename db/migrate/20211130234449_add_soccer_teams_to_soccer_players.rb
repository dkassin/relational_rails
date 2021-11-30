class AddSoccerTeamsToSoccerPlayers < ActiveRecord::Migration[5.2]
  def change
    add_reference :soccer_players, :soccer_teams, foreign_key: true
  end
end
