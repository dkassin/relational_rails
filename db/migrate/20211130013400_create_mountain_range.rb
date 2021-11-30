class CreateMountainRange < ActiveRecord::Migration[5.2]
  def change
    create_table :mountain_ranges do |t|
      t.string :name
      t.boolean :has_ski_resort
      t.integer :included_states
    end
  end
end
