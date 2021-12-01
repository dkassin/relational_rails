class CreateSoccerPlayer < ActiveRecord::Migration[5.2]
  def change
    create_table :soccer_players do |t|
      t.string :name
      t.boolean :homegrown_player
      t.integer :games_played
      t.references :soccer_team, foreign_key: true

      t.timestamps
    end
  end
end
