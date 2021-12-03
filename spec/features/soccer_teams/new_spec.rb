require 'rails_helper'

RSpec.describe 'New Soccer Team' do
  describe 'As a visitor' do
    describe ' When I visit the new soccer team form by clicking on a link in the index' do
      it 'I can create a new soccer team' do
        visit "/soccer_teams"

        click_link 'Add another Soccer Team'

        expect(current_path).to eq('/soccer_teams/new')

        fill_in('name', with: 'Mallorca')
        fill_in('qualified_champ_league', with: false)
        fill_in('points', with: 16)

        click_on('Create Soccer Team')


        expect(current_path).to eq("/soccer_teams")
        expect(page).to have_content("Mallorca")
        expect(page).to have_content(false)
        expect(page).to have_content(16)
      end
    end
  end
end
