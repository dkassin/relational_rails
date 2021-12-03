require 'rails_helper'

RSpec.describe 'the mountain ranges index web page' do
  before :each do
    @rocky = MountainRange.create!(name: "Rocky Mountains", has_ski_resort: true, included_states: 4)
    @appalachian = MountainRange.create!(name: "Appalachian Mountains", has_ski_resort: true, included_states: 12)
    @cascade = MountainRange.create!(name: "Cascade Range", has_ski_resort: true, included_states: 3)
    @sierra = MountainRange.create!(name: "Sierra Nevada", has_ski_resort: false, included_states: 1)
  end
  it "will show the mountain ranges" do

    #localhost:3000/mountain_ranges
    visit "/mountain_ranges"

    expect(page).to have_content(@rocky.name)
    expect(page).to have_content(@appalachian.name)
    expect(page).to have_content(@cascade.name)
    expect(page).to have_content(@sierra.name)
  end

  it "orders mountain ranges by created first and displays creation date" do

    visit "/mountain_ranges"

    expect(page).to have_content(@rocky.created_at)
    expect(page).to have_content(@appalachian.created_at)
    expect(page).to have_content(@cascade.created_at)
    expect(page).to have_content(@sierra.created_at)
  end

  it "gives links to all indexes for all tables" do

    visit "/mountain_ranges"

    click_on "Soccer Team Index"
    expect(current_path).to eq ("/soccer_teams")
  end

  it "gives a link to create a new mountain range" do

    visit "/mountain_ranges"

    click_on "Add another Mountain Range"
    expect(current_path).to eq ("/mountain_ranges/new")
  end

end
