require 'rails_helper'

RSpec.describe 'New Soccer Team' do
  before :each do
    @rm = SoccerTeam.create!(name: 'Real Madrid', qualified_champ_league: true, points: 23)
    @bar = SoccerTeam.create!(name: 'Barcelona', qualified_champ_league: true, points: 13)
    @cad = SoccerTeam.create!(name: 'Cadiz CF', qualified_champ_league: false, points: 22)
    @bet = SoccerTeam.create!(name: 'Real Betis', qualified_champ_league: false, points: 11)
    @am = SoccerTeam.create!(name: 'Aletico Madrid', qualified_champ_league: true, points: 28)
  end
  describe 'As a visitor' do
    describe ' When I visit a soccer team show page and click a link' do
      it 'I can edit a soccer team' do
        visit "/soccer_teams/#{@rm.id}"

        click_link 'Update Soccer Team'

        expect(current_path).to eq("/soccer_teams/#{@rm.id}/edit")

        fill_in('name', with: 'Real Madrid Edit')
        fill_in('qualified_champ_league', with: false)
        fill_in('points', with: 16)

        click_on('Update Soccer Team')


        expect(current_path).to eq("/soccer_teams/#{@rm.id}")
        expect(page).to have_content("Real Madrid Edit")
        expect(page).to have_content(false)
        expect(page).to have_content(16)
      end
    end
  end
end
