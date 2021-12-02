require 'rails_helper'

RSpec.describe MountainRange do
  it { should have_many :mountains}

  describe 'instance methods' do
    describe 'sorted by created date' do
      before :each do
        @rocky = MountainRange.create!(name: "Rocky Mountains", has_ski_resort: true, included_states: 4)
        @appalachian = MountainRange.create!(name: "Appalachian Mountains", has_ski_resort: true, included_states: 12)

        @pikes = @rocky.mountains.create!(name: "Pikes Peak", volcanic: false, elevation: 14115)
        @longs = @rocky.mountains.create!(name: "Longs Peak", volcanic: false, elevation: 14259)
        @bard = @rocky.mountains.create!(name: "Bard Peak", volcanic: false, elevation: 13647)
        @herman = @rocky.mountains.create!(name: "Mount Herman", volcanic: false, elevation: 9063)

        @washington = @appalachian.mountains.create!(name: "Mount Washington", volcanic: false, elevation: 6288)
        @mitchell = @appalachian.mountains.create!(name: "Mount Mitchell", volcanic: false, elevation: 6684)
        @katahdin = @appalachian.mountains.create!(name: "Mount Katahdin", volcanic: false, elevation: 5268)
      end

      it "orders teams by created first and displays creation date" do
        all_ranges = MountainRange.sort_range

        expect(all_ranges[0]).to eq @rocky
        expect(all_ranges[1]).to eq @appalachian
      end
    end
  end
end
