require 'rails_helper'

RSpec.describe "SoccerTeam SoccerPlayers index" do
  before :each do
    @rm = SoccerTeam.create!(name: 'Real Madrid', qualified_champ_league: true, points: 23)
    @bar = SoccerTeam.create!(name: 'Barcelona', qualified_champ_league: true, points: 13)
    @cad = SoccerTeam.create!(name: 'Cadiz CF', qualified_champ_league: false, points: 22)
    @bet = SoccerTeam.create!(name: 'Real Betis', qualified_champ_league: false, points: 11)
    @am = SoccerTeam.create!(name: 'Aletico Madrid', qualified_champ_league: true, points: 28)

    @jimmy_g = @rm.soccer_players.create!(name: 'Jimmy G', homegrown_player: false, games_played: 23)
    @jay_c = @rm.soccer_players.create!(name: 'Jay C', homegrown_player: true, games_played: 67)

    @cay_c = @bar.soccer_players.create!(name: 'Cay C', homegrown_player: true, games_played: 86)
    @rob_c = @bar.soccer_players.create!(name: 'Rob C', homegrown_player: true, games_played: 64)
    @jose_r = @bar.soccer_players.create!(name: 'Jose R', homegrown_player: false, games_played: 14)

    @luis_c = @cad.soccer_players.create!(name: 'Luis C', homegrown_player: false, games_played: 14)
    @romeo_f = @cad.soccer_players.create!(name: 'Romeo F', homegrown_player: true, games_played: 34)
    @tim_g = @cad.soccer_players.create!(name: 'Tim G', homegrown_player: false, games_played: 124)
    @jun_f = @bet.soccer_players.create!(name: 'Jun F', homegrown_player: true, games_played: 202)

    @sam_g = @am.soccer_players.create!(name: 'Sam G', homegrown_player: false, games_played: 224)
    @ron_l = @am.soccer_players.create!(name: 'Ron L', homegrown_player: true, games_played: 104)
  end

  it "shows all of the names of the players for the team" do
    visit "/soccer_teams/#{@cad.id}/soccer_players"

    expect(page).to have_content(@luis_c.name)
    expect(page).to have_content(@romeo_f.name)
    expect(page).to have_content(@tim_g.name)
  end

  it "user will see soccer player index page, then click a button and it will sort alphabetically" do

    visit "/soccer_teams/#{@bar.id}/soccer_players"

    expect(page).to_not have_content(@jimmy_g.name)
    expect(page).to_not have_content(@jimmy_g.games_played)

    expect(page).to have_content(@rob_c.name)
    expect(page).to have_content(@rob_c.homegrown_player)
    expect(page).to have_content(@rob_c.games_played)


    click_link 'Sort Soccer Players in Alphabetical order'

    expect(current_path).to eq("/soccer_teams/#{@bar.id}/soccer_players/")

    expect(@cay_c.name).to appear_before(@jose_r.name)
    expect(@jose_r.name).to appear_before(@rob_c.name)
  end

  it "it will show a link next to a soccer player, when clicked, it will take user to an edit page" do
    visit "/soccer_teams/#{@bar.id}/soccer_players"

    click_link ("edit #{@rob_c.name.downcase} info")

    expect(current_path).to eq ("/soccer_players/#{@rob_c.id}/edit/")

  end

  it "there will be a form to enter a number of games played and only return players that have more" do
    visit "/soccer_teams/#{@bar.id}/soccer_players"

    fill_in('games', with: '75')
    click_on('Submit')

    expect(current_path).to eq ("/soccer_teams/#{@bar.id}/soccer_players")
    expect(page).to have_content(@cay_c.name)
    expect(page).to_not have_content(@rob_c.name)
    expect(page).to_not have_content(@jose_r.name)

  end

  it "it will show a link next to a soccer teams soccer players index, when clicked, it will delete the player" do


    visit "/soccer_teams/#{@bar.id}/soccer_players"

    click_link ("Delete #{@rob_c.name.downcase}")

    expect(current_path).to eq ("/soccer_players")

    expect(page).to_not have_content(@rob_c.name)
  end
end
