class Mountain < ApplicationRecord
  belongs_to :mountain_range

  def self.volcanic_only
    self.all.select do |mountain|
      mountain.volcanic == true
    end
  end
end
