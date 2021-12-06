require 'rails_helper'

RSpec.describe 'Update Moutain' do
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
  describe ' When I visit a mountains show page,  there is a link' do
    it 'I can update the attributes of the mountain' do
      visit "/mountains/#{@pikes.id}"

      click_link 'Update Mountain'

      expect(current_path).to eq("/mountains/#{@pikes.id}/edit")

      fill_in('name', with: 'Pikes')
      fill_in('volcanic', with: false)
      fill_in('elevation', with:13130)

      click_on('Update Mountain')


      expect(current_path).to eq("/mountains/#{@pikes.id}")
      expect(page).to have_content("Pikes")
      expect(page).to have_content(false)
      expect(page).to have_content(13130)
    end
  end
end
end
