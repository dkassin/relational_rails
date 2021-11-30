class CreateMountains < ActiveRecord::Migration[5.2]
  def change
    create_table :mountains do |t|
      t.string :name
      t.boolean :volcanic
      t.integer :elevation
    end
  end
end
