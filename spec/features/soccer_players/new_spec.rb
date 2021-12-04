require 'rails_helper'

RSpec.describe 'New Soccer Player' do
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

describe 'As a visitor' do
  describe ' When I visit the soccer teams, soccer player index there is a link' do
    it 'I can create a new soccer player for that team' do
      visit "/soccer_teams/#{@cad.id}/soccer_players"

      click_link 'Add another Soccer Player'

      expect(current_path).to eq("/soccer_teams/#{@cad.id}/soccer_players/new")

      fill_in('name', with: 'Chris H')
      fill_in('homegrown_player', with: true)
      fill_in('games_played', with: 88)

      click_on('Create Soccer Player')


      expect(current_path).to eq("/soccer_teams/#{@cad.id}/soccer_players")
      expect(page).to have_content("Chris H")
      expect(page).to have_content(true)
      expect(page).to have_content(88)
    end
  end
end
end
