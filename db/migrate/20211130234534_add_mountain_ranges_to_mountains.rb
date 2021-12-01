class AddMountainRangesToMountains < ActiveRecord::Migration[5.2]
  def change
    add_reference :mountains, :mountain_ranges, foreign_key: true
  end
end
