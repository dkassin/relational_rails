require 'rails_helper'

RSpec.describe 'the mountain ranges show web page' do
  before :each do
    @rocky = MountainRange.create!(name: "Rocky Mountains", has_ski_resort: true, included_states: 4)
    @appalachian = MountainRange.create!(name: "Appalachian Mountains", has_ski_resort: false, included_states: 12)

    @pikes = @rocky.mountains.create!(name: "Pikes Peak", volcanic: false, elevation: 14115)
    @longs = @rocky.mountains.create!(name: "Longs Peak", volcanic: false, elevation: 14259)
    @bard = @rocky.mountains.create!(name: "Bard Peak", volcanic: false, elevation: 13647)
    @herman = @rocky.mountains.create!(name: "Mount Herman", volcanic: false, elevation: 9063)

    @washington = @appalachian.mountains.create!(name: "Mount Washington", volcanic: false, elevation: 6288)
    @mitchell = @appalachian.mountains.create!(name: "Mount Mitchell", volcanic: false, elevation: 6684)
    @katahdin = @appalachian.mountains.create!(name: "Mount Katahdin", volcanic: false, elevation: 5268)
  end

  it "will show the mountain range and its attributes" do
    visit "/mountain_ranges/#{@rocky.id}"

    expect(page).to have_content(@rocky.name)
    expect(page).to have_content(@rocky.has_ski_resort)
    expect(page).to have_content(@rocky.included_states)
    expect(page).to_not have_content(@appalachian.name)
    expect(page).to_not have_content(@appalachian.has_ski_resort)
    expect(page).to_not have_content(@appalachian.included_states)
  end

  it "displays the count of the mountains in a mountain range" do
    visit "/mountain_ranges/#{@rocky.id}"

    expect(page).to have_content(@rocky.mountain_count)
  end

end
