class CreateHoleInformations < ActiveRecord::Migration
  def self.up
    create_table :hole_informations do |t|
      t.string :color
      t.integer :distance
      t.integer :hole_id
      t.integer :difficulty

      t.timestamps
    end
  end

  def self.down
    drop_table :hole_informations
  end
end
