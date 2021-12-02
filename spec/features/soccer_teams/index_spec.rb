require 'rails_helper'

RSpec.describe 'the soccer teams index web page' do
  it "will show the soccer teams" do
    @rm = SoccerTeam.create!(name: 'Real Madrid', qualified_champ_league: true, points: 23)
    @bar = SoccerTeam.create!(name: 'Barcelona', qualified_champ_league: true, points: 13)
    @cad = SoccerTeam.create!(name: 'Cadiz CF', qualified_champ_league: false, points: 22)
    @bet = SoccerTeam.create!(name: 'Real Betis', qualified_champ_league: false, points: 11)
    @am = SoccerTeam.create!(name: 'Aletico Madrid', qualified_champ_league: true, points: 28)

    visit "/soccer_teams"

    expect(page).to have_content(@rm.name)
    expect(page).to have_content(@bar.name)
    expect(page).to have_content(@cad.name)
    expect(page).to have_content(@bet.name)
    expect(page).to have_content(@am.name)
  end
end
