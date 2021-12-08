class MountainRange < ApplicationRecord
  has_many :mountains, :dependent => :destroy

  def self.sort_range
    MountainRange.order(:created_at)
  end

  def mountain_count
    mountains.count
  end

end
