require 'rails_helper'

RSpec.describe MountainRange do
  describe 'validations' do
    it { should have_many :mountains}
  end
  # describe 'relations' do
  #   it "has_many" do
  #   rocky = MountainRanges.create!(name: "Rocky Mountains", has_ski_resort: true, included_states: 4)
  #   rocky.mountains.create!(name: "Rey", volcanic: true, elevation: 12311)
  #   expect()
  #   end
  # end

end
