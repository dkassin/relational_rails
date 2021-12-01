require 'rails_helper'

RSpec.describe 'the soccer players show web page' do
  it "will show the mountain and its attributes" do

    team = SoccerTeams.create!(name: 'Real Madrid', qualified_champ_league: true, points: 23)

    player = SoccerPlayer.create!(name: 'Jimmy G', homegrown_player: false, games_played: 23, soccer_team_id: team.id)

    #localhost:3000/mountains/4
    visit "/soccer_players/#{player.id}"
  end
end
