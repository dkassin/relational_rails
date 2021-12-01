require 'rails_helper'

RSpec.describe 'the mountains index web page' do
  it "will show the mountains" do
    rocky = MountainRange.create!(name: "Rocky Mountains", has_ski_resort: true, included_states: 4)
    mountain = Mountain.create!(name: "Rey", volcanic: true, elevation: 12311, mountain_range_id: rocky.id)

    #localhost:3000/mountains
    visit "/mountains"
  end
end 
