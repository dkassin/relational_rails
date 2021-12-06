require 'rails_helper'

RSpec.describe Mountain do
  it { should belong_to :mountain_range}

  describe 'class methods' do

      before :each do
        @rocky = MountainRange.create!(name: "Rocky Mountains", has_ski_resort: true, included_states: 4)
        @appalachian = MountainRange.create!(name: "Appalachian Mountains", has_ski_resort: true, included_states: 12)

        @pikes = @rocky.mountains.create!(name: "Pikes Peak", volcanic: true, elevation: 14115)
        @longs = @rocky.mountains.create!(name: "Longs Peak", volcanic: true, elevation: 14259)
        @bard = @rocky.mountains.create!(name: "Bard Peak", volcanic: false, elevation: 13647)
        @herman = @rocky.mountains.create!(name: "Mount Herman", volcanic: false, elevation: 9063)

        @washington = @appalachian.mountains.create!(name: "Mount Washington", volcanic: false, elevation: 6288)
        @mitchell = @appalachian.mountains.create!(name: "Mount Mitchell", volcanic: true, elevation: 6684)
        @katahdin = @appalachian.mountains.create!(name: "Mount Katahdin", volcanic: false, elevation: 5268)
      end

      it ' only displays mountains that are volcanic' do
        all_mountains = Mountain.volcanic_only

        expect(all_mountains.include?(@pikes)).to eq true
        expect(all_mountains.include?(@longs)).to eq true
        expect(all_mountains.include?(@mitchell)).to eq true
        expect(all_mountains.include?(@bard)).to eq false
        expect(all_mountains.include?(@herman)).to eq false
        expect(all_mountains.include?(@washington)).to eq false
        expect(all_mountains.include?(@katahdin)).to eq false

    end
  end
end
