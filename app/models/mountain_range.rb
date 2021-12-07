class MountainRange < ApplicationRecord
  has_many :mountains, :dependent => :destroy

  def self.sort_range
    self.all.sort_by{|range| range.created_at}
  end

  def mountain_count
    self.mountains.count
  end

end
