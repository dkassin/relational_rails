require 'rails_helper'

RSpec.describe 'New Mountain Range' do
  before :each do
    @rocky = MountainRange.create!(name: "Rocky Mountains", has_ski_resort: true, included_states: 4)
    @appalachian = MountainRange.create!(name: "Appalachian Mountains", has_ski_resort: true, included_states: 12)
    @cascade = MountainRange.create!(name: "Cascade Range", has_ski_resort: true, included_states: 3)
    @sierra = MountainRange.create!(name: "Sierra Nevada", has_ski_resort: false, included_states: 1)
  end
  describe 'As a visitor' do
    describe ' When I visit a Mountain Range show page and click a link' do
      it 'I can edit a Mountain Range' do
        visit "/mountain_ranges/#{@rocky.id}"

        click_link 'Update Mountain Range'

        expect(current_path).to eq("/mountain_ranges/#{@rocky.id}/edit")

        fill_in('name', with: 'Rocky Mountain Edit')
        fill_in('has_ski_resort', with: false)
        fill_in('included_states', with: 2)

        click_on('Update Mountain Range')


        expect(current_path).to eq("/mountain_ranges/#{@rocky.id}")
        expect(page).to have_content("Rocky Mountain Edit")
        expect(page).to have_content(false)
        expect(page).to have_content(2)
      end
    end
  end
end
