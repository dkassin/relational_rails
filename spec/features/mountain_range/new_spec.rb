require 'rails_helper'

RSpec.describe 'New Mountain Range' do
  describe 'As a visitor' do
    describe ' When I visit the new mountain range form by clicking on a link in the index' do
      it 'I can create a new mountain range' do
        visit "/mountain_ranges"

        click_link 'Add another Mountain Range'

        expect(current_path).to eq('/mountain_ranges/new')

        fill_in('name', with: 'Andes')
        fill_in('has_ski_resort', with: false)
        fill_in('included_states', with: 0)

        click_on('Create Mountain Range')


        expect(current_path).to eq("/mountain_ranges")
        expect(page).to have_content("Andes")
        expect(page).to have_content(false)
        expect(page).to have_content(0)
      end
    end
  end
end
