require 'rails_helper'

RSpec.describe 'the soccer players show web page' do
  it "will show the mountain and its attributes" do
    rm = SoccerTeam.create!(name: 'Real Madrid', qualified_champ_league: true, points: 23)
    bar = SoccerTeam.create!(name: 'Barcelona', qualified_champ_league: true, points: 13)

    jimmy_g = rm.soccer_players.create!(name: 'Jimmy G', homegrown_player: false, games_played: 23)

    rob_c = bar.soccer_players.create!(name: 'Rob C', homegrown_player: true, games_played: 64)

    visit "/soccer_players/#{jimmy_g.id}"

    expect(page).to have_content(jimmy_g.name)
    expect(page).to have_content(jimmy_g.homegrown_player)
    expect(page).to have_content(jimmy_g.games_played)
    expect(page).to_not have_content(rob_c.name)
    expect(page).to_not have_content(rob_c.homegrown_player)
    expect(page).to_not have_content(rob_c.games_played)
  end
end
