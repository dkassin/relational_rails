require 'rails_helper'

RSpec.describe 'the soccer teams show web page' do
  before :each do
    @rm = SoccerTeam.create!(name: 'Real Madrid', qualified_champ_league: true, points: 23)
    @bar = SoccerTeam.create!(name: 'Barcelona', qualified_champ_league: false, points: 13)

    @jimmy_g = @rm.soccer_players.create!(name: 'Jimmy G', homegrown_player: false, games_played: 23)
    @jay_c = @rm.soccer_players.create!(name: 'Jay C', homegrown_player: true, games_played: 67)

    @cay_c = @bar.soccer_players.create!(name: 'Cay C', homegrown_player: true, games_played: 86)
    @rob_c = @bar.soccer_players.create!(name: 'Rob C', homegrown_player: true, games_played: 64)
    @jose_r = @bar.soccer_players.create!(name: 'Jose R', homegrown_player: false, games_played: 14)
  end

  it "will show the soccer teams attributes" do

    visit "/soccer_teams/#{@rm.id}"

    expect(page).to have_content(@rm.name)
    expect(page).to have_content(@rm.qualified_champ_league)
    expect(page).to have_content(@rm.points)
    expect(page).to_not have_content(@bar.name)
    expect(page).to_not have_content(@bar.qualified_champ_league)
    expect(page).to_not have_content(@bar.points)
  end

  it "displays the count of the soccer players on a team" do
    visit "/soccer_teams/#{@rm.id}"

    expect(page).to have_content(@rm.player_count)
  end

  it "gives a link to go to the soccer team's soccer players page" do
    visit "/soccer_teams/#{@rm.id}"

    click_on "Soccer Players on Team"
    expect(current_path).to eq ("/soccer_teams/#{@rm.id}/soccer_players")
  end
end
