class CreateHoles < ActiveRecord::Migration
  def self.up
    create_table :holes do |t|
      t.integer :position, :null => false
      t.integer :par, :null => false
      t.string :description
      t.integer :handicap, :null => false
      t.integer :course_id

      t.timestamps
    end
  end

  def self.down
    drop_table :holes
  end
end
