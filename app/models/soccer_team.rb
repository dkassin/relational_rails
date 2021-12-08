class SoccerTeam < ApplicationRecord
  has_many :soccer_players, :dependent => :destroy

  def self.sort_team
    SoccerTeam.order(:created_at)
  end

  def player_count
    soccer_players.count
  end
end
