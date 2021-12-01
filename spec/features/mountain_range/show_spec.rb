require 'rails_helper'

RSpec.describe 'the mountain ranges show web page' do
  it "will show the mountain range and its attributes" do
    rocky = MountainRange.create!(name: "Rocky Mountains", has_ski_resort: true, included_states: 4)

    #localhost:3000/mountain_ranges/4
    visit "/mountain_ranges/#{rocky.id}"
  end
end
