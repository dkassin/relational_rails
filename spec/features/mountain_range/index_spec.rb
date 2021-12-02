require 'rails_helper'

RSpec.describe 'the mountain ranges index web page' do
  it "will show the mountain ranges" do
    rocky = MountainRange.create!(name: "Rocky Mountains", has_ski_resort: true, included_states: 4)
    appalachian = MountainRange.create!(name: "Appalachian Mountains", has_ski_resort: true, included_states: 12)
    cascade = MountainRange.create!(name: "Cascade Range", has_ski_resort: true, included_states: 3)
    sierra = MountainRange.create!(name: "Sierra Nevada", has_ski_resort: false, included_states: 1)

    #localhost:3000/mountain_ranges
    visit "/mountain_ranges"

    expect(page).to have_content(rocky.name)
    expect(page).to have_content(appalachian.name)
    expect(page).to have_content(cascade.name)
    expect(page).to have_content(sierra.name)
  end
end
