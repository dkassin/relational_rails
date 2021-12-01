require 'rails_helper'

RSpec.describe 'the mountains show web page' do
  it "will show the mountain and its attributes" do
    rocky = MountainRange.create!(name: "Rocky Mountains", has_ski_resort: true, included_states: 4)
    mountain = Mountain.create!(name: "Rey", volcanic: true, elevation: 12311, mountain_range_id: rocky.id)

    #localhost:3000/mountains/4
    visit "/mountains/#{mountain.id}"
  end
end
