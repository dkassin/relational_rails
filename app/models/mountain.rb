class Mountain < ApplicationRecord
  belongs_to :mountain_range

  def self.volcanic_only
    self.all.select do |mountain|
      mountain.volcanic == true
    end
  end

  def self.sorted
    self.all.sort_by {|mountain| mountain.name}
  end

  def self.elevation_threshold(elevation_count)
    Mountain.select(:name, :volcanic, :elevation)
                .where("elevation > ?", elevation_count)
  end

end
