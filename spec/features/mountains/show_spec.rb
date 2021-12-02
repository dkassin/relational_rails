require 'rails_helper'

RSpec.describe 'the mountains show web page' do
  it "will show the mountain and its attributes" do
    rocky = MountainRange.create!(name: "Rocky Mountains", has_ski_resort: true, included_states: 4)
    appalachian = MountainRange.create!(name: "Appalachian Mountains", has_ski_resort: true, included_states: 12)

    pikes = rocky.mountains.create!(name: "Pikes Peak", volcanic: false, elevation: 14115)

    washington = appalachian.mountains.create!(name: "Mount Washington", volcanic: true, elevation: 6288)

    visit "/mountains/#{pikes.id}"

    expect(page).to have_content(pikes.name)
    expect(page).to have_content(pikes.volcanic)
    expect(page).to have_content(pikes.elevation)
    expect(page).to_not have_content(washington.name)
    expect(page).to_not have_content(washington.volcanic)
    expect(page).to_not have_content(washington.elevation)
  end
end
