class CreateRoundHoles < ActiveRecord::Migration
  def self.up
    create_table :round_holes do |t|
      t.integer :round_id
      t.integer :score
      t.boolean :fairway
      t.boolean :green
      t.boolean :sandsave
      t.integer :putts

      t.timestamps
    end
  end

  def self.down
    drop_table :round_holes
  end
end
