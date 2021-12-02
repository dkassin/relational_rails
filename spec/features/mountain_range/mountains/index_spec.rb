require 'rails_helper'

RSpec.describe "MountainRange Mountains index" do
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
  it "shows all names for the mountains of the mountain range" do
    visit "/mountain_ranges/#{@rocky.id}/mountains"

    expect(page).to have_content(@pikes.name)
    expect(page).to have_content(@longs.name)
    expect(page).to have_content(@bard.name)
    expect(page).to have_content(@herman.name)
  end
end 
