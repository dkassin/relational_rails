require 'rails_helper'

RSpec.describe 'the soccer teams show web page' do
  it "will show the soccer teams attributes" do
    @rm = SoccerTeam.create!(name: 'Real Madrid', qualified_champ_league: true, points: 23)
    @bar = SoccerTeam.create!(name: 'Barcelona', qualified_champ_league: false, points: 13)

    visit "/soccer_teams/#{@rm.id}"

    expect(page).to have_content(@rm.name)
    expect(page).to have_content(@rm.qualified_champ_league)
    expect(page).to have_content(@rm.points)
    expect(page).to_not have_content(@bar.name)
    expect(page).to_not have_content(@bar.qualified_champ_league)
    expect(page).to_not have_content(@bar.points)
  end
end
