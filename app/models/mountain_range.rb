class MountainRange < ApplicationRecord
  has_many :mountains

  def self.sort_range
    all_ranges = self.all
    all_ranges.sort_by{|range| range.created_at}
  end

  def mountain_count
    self.mountains.count
  end 
end
