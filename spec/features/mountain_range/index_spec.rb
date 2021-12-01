require 'rails_helper'

RSpec.describe 'the mountain ranges index web page' do
  it "will show the mountain ranges" do
    rocky = MountainRange.create!(name: "Rocky Mountains", has_ski_resort: true, included_states: 4)
    #localhost:3000/mountain_ranges
    visit "/mountain_ranges"
  end
end 
