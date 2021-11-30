class CreateSoccerTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :soccer_teams do |t|
      t.string :name
      t.boolean :qualified_champ_league
      t.integer :points
    end
  end
end
