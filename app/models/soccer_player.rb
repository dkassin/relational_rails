class SoccerPlayer < ApplicationRecord
  belongs_to :soccer_team


  def self.homegrown_player_only
    SoccerPlayer.select(:id,:name,:homegrown_player, :games_played)
                .where(homegrown_player: true)
  end

  def self.sorted
    SoccerPlayer.order(:name)
  end

  def self.games_threshold(games)
    SoccerPlayer.select(:name, :homegrown_player, :games_played)
                .where("games_played > ?", games)
  end
end
