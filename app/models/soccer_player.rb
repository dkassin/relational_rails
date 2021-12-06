class SoccerPlayer < ApplicationRecord
  belongs_to :soccer_team


  def self.homegrown_player_only
    self.all.select do |player|
      player.homegrown_player == true
    end
  end

  def self.sorted
    self.homegrown_player_only.sort_by {|player| player.name}
  end
end
