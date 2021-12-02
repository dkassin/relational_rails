require 'rails_helper'

RSpec.describe 'the mountains index web page' do
  it "will show the mountains" do
    rocky = MountainRange.create!(name: "Rocky Mountains", has_ski_resort: true, included_states: 4)
    appalachian = MountainRange.create!(name: "Appalachian Mountains", has_ski_resort: true, included_states: 12)

    pikes = rocky.mountains.create!(name: "Pikes Peak", volcanic: false, elevation: 14115)

    washington = appalachian.mountains.create!(name: "Mount Washington", volcanic: false, elevation: 6288)
    #localhost:3000/mountains
    visit "/mountains"

    expect(page).to have_content(pikes.name)
    expect(page).to have_content(pikes.volcanic)
    expect(page).to have_content(pikes.elevation)
    expect(page).to have_content(washington.name)
    expect(page).to have_content(washington.volcanic)
    expect(page).to have_content(washington.elevation)
  end

  it "gives links to all indexes for all tables" do

    visit "/mountains"
    
    click_on "Soccer Team Index"
    expect(current_path).to eq ("/soccer_teams")
  end

end
