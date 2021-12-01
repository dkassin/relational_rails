require 'rails_helper'

RSpec.describe 'the mountain range and related mountains index web page' do
  it "will show the mountains related to a given mountain range" do
    rocky = MountainRange.create!(name: "Rocky Mountains", has_ski_resort: true, included_states: 4)
    mountain = Mountain.create!(name: "Rey", volcanic: true, elevation: 12311, mountain_range_id: rocky.id)

    #localhost:3000/mountain_ranges/4/mountains
    visit "/mountain_ranges/#{rocky.id}/mountains"
  end
end 
