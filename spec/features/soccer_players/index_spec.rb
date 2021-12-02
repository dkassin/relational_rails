require 'rails_helper'

RSpec.describe 'the soccer players index web page' do
  it "will show the soccer players" do
    rm = SoccerTeam.create!(name: 'Real Madrid', qualified_champ_league: true, points: 23)
    bar = SoccerTeam.create!(name: 'Barcelona', qualified_champ_league: true, points: 13)

    jimmy_g = rm.soccer_players.create!(name: 'Jimmy G', homegrown_player: false, games_played: 23)

    rob_c = bar.soccer_players.create!(name: 'Rob C', homegrown_player: true, games_played: 64)

    visit "/soccer_players"

    expect(page).to have_content(jimmy_g.name)
    expect(page).to have_content(jimmy_g.homegrown_player)
    expect(page).to have_content(jimmy_g.games_played)
    expect(page).to have_content(rob_c.name)
    expect(page).to have_content(rob_c.homegrown_player)
    expect(page).to have_content(rob_c.games_played)
  end
end
