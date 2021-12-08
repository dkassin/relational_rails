require 'rails_helper'

RSpec.describe SoccerPlayer do
  it { should belong_to :soccer_team}

  describe 'class methods' do

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
      it ' only displays players that are homegrown' do
        all_players = SoccerPlayer.homegrown_player_only

        expect(all_players.include?(@jay_c)).to eq true
        expect(all_players.include?(@cay_c)).to eq true
        expect(all_players.include?(@rob_c)).to eq true
        expect(all_players.include?(@romeo_f)).to eq true
        expect(all_players.include?(@jun_f)).to eq true
        expect(all_players.include?(@ron_l)).to eq true
        expect(all_players.include?(@jimmy_g)).to eq false
        expect(all_players.include?(@tim_g)).to eq false
      end

      it ' sorts soccer players by alphabetical order' do
        all_players = SoccerPlayer.sorted
        expected = [@cay_c,@jay_c,@jimmy_g,@jose_r,@jun_f,@luis_c,@rob_c,@romeo_f,@ron_l,@sam_g,@tim_g]

        expect(all_players).to eq(expected)
      end

      it 'selects soccer players that have played a certain amount of games' do
        all_played_alot = SoccerPlayer.games_threshold(200)
        expected = [@jun_f,@sam_g]

        expect(all_played_alot).to eq(expected)
      end
  end
end
