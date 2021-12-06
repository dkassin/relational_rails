class SoccerPlayer < ApplicationRecord
  belongs_to :soccer_team


  def self.homegrown_player_only
    self.all.select do |player|
      player.homegrown_player == true
    end
  end
end
