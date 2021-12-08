class Mountain < ApplicationRecord
  belongs_to :mountain_range

  def self.volcanic_only
    Mountain.select(:id, :name, :volcanic, :elevation)
            .where(volcanic: true)
  end

  def self.sorted
    Mountain.order(:name)
  end

  def self.elevation_threshold(elevation_count)
    Mountain.select(:name, :volcanic, :elevation)
                .where("elevation > ?", elevation_count)
  end

end
