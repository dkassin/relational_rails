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

  it "user will see mountain range index page, then click a button and it will sort alphabetically" do

    visit "/mountain_ranges/#{@rocky.id}/mountains"

    expect(page).to_not have_content(@mitchell.name)
    expect(page).to_not have_content(@mitchell.elevation)

    expect(page).to have_content(@pikes.name)
    expect(page).to have_content(@pikes.volcanic)
    expect(page).to have_content(@pikes.elevation)


    click_link 'Sort Mountains in Alphabetical order'

    expect(current_path).to eq("/mountain_ranges/#{@rocky.id}/mountains/")

    expect(@bard.name).to appear_before(@longs.name)
    expect(@longs.name).to appear_before(@herman.name)
    expect(@herman.name).to appear_before(@pikes.name)
  end

end
