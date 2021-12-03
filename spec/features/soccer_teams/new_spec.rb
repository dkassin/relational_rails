require 'rails_helper'

RSpec.describe 'New Soccer Team' do
  describe 'As a visitor' do
    describe ' When I visit the new soccer team form by clicking on a link in the index' do
      it 'I can create a new soccer team' do
        visit "/soccer_teams"

        click_link 'Add another Soccer Team'

        expect(current_path).to eq('/soccer_teams/new')

        fill_in('soccer_teams[name]', with: 'Mallorca')
        fill_in('soccer_teams[qualified_champ_league]', with: false)
        fill_in('soccer_teams[points]', with: 16)

        click_on('submit')
        require 'pry'; binding.pry
        soccer_team_id = SoccerTeam.last.id

        expect(current_path).to eq("/soccer_teams/#{soccer_team_id}")
        expect(page).to have_content("Mallorca")
      end
    end
  end
end
