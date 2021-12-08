class SoccerPlayer < ApplicationRecord
  belongs_to :soccer_team


  def self.homegrown_player_only
    self.all.select do |player|
      player.homegrown_player == true
    end
  end

  def self.sorted
    self.all.sort_by {|player| player.name}
  end

  def self.games_threshold(games)
    SoccerPlayer.select(:name, :homegrown_player, :games_played)
                .where("games_played > ?", games)
  end
end
