class CreateSoccerPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :soccer_players do |t|
      t.string :name
      t.boolean :homegrown_player
      t.integer :games_played
    end
  end
end
