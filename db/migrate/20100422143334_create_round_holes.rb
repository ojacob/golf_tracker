class CreateRoundHoles < ActiveRecord::Migration
  def self.up
    create_table :round_holes do |t|
      t.integer :position
      t.integer :round_id, :null => false
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
