class SoccerTeam < ApplicationRecord
  has_many :soccer_players

  def self.sort_team
    all_teams = self.all
    all_teams.sort_by {|team| team.created_at}
  end

  def player_count
    self.soccer_players.count
  end
end
