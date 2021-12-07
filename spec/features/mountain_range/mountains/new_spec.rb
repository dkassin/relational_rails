require 'rails_helper'

RSpec.describe 'New Mountain' do
  before :each do
    @rocky = MountainRange.create!(name: "Rocky Mountains", has_ski_resort: true, included_states: 4)
    @appalachian = MountainRange.create!(name: "Appalachian Mountains", has_ski_resort: true, included_states: 12)

    @pikes = @rocky.mountains.create!(name: "Pikes Peak", volcanic: false, elevation: 14115)
    @longs = @rocky.mountains.create!(name: "Longs Peak", volcanic: false, elevation: 14259)
    @bard = @rocky.mountains.create!(name: "Bard Peak", volcanic: false, elevation: 13647)
    @herman = @rocky.mountains.create!(name: "Mount Herman", volcanic: false, elevation: 9063)

    @washington = @appalachian.mountains.create!(name: "Mount Washington", volcanic: false, elevation: 6288)
    @mitchell = @appalachian.mountains.create!(name: "Mount Mitchell", volcanic: false, elevation: 6684)
    @katahdin = @appalachian.mountains.create!(name: "Mount Katahdin", volcanic: false, elevation: 5268)
  end
  describe 'As a visitor' do
    describe ' When I visit the mountains, mountains index there is a link' do
      it 'I can create a new mountain for that mountain range' do
        visit "/mountain_ranges/#{@rocky.id}/mountains"

        click_link 'Add another Mountain'

        expect(current_path).to eq("/mountain_ranges/#{@rocky.id}/mountains/new")

        fill_in('name', with: 'Mt. Napier')
        fill_in('volcanic', with: true)
        fill_in('elevation', with: 8815)

        click_on('Create Mountain')

        expect(current_path).to eq("/mountain_ranges/#{@rocky.id}/mountains")
        expect(page).to have_content("Mt. Napier")
        expect(page).to have_content(true)
        expect(page).to have_content(8815)
      end
    end
  end
end
