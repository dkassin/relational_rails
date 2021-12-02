require 'rails_helper'

RSpec.describe 'the mountain ranges show web page' do
  it "will show the mountain range and its attributes" do
    rocky = MountainRange.create!(name: "Rocky Mountains", has_ski_resort: true, included_states: 4)
    appalachian = MountainRange.create!(name: "Appalachian Mountains", has_ski_resort: true, included_states: 12)

    #localhost:3000/mountain_ranges/4
    visit "/mountain_ranges/#{rocky.id}"

    expect(page).to have_content(rocky.name)
    expect(page).to have_content(rocky.has_ski_resort)
    expect(page).to have_content(rocky.included_states)
    expect(page).to_not have_content(appalachian.name)
    expect(page).to_not have_content(appalachian.has_ski_resort)
    expect(page).to_not have_content(appalachian.included_states)
  end
end
