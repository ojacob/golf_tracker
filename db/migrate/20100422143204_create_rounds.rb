class CreateRounds < ActiveRecord::Migration
  def self.up
    create_table :rounds do |t|
      t.integer :course_id, :null => false
      t.string :tee
      t.datetime :played_on

      t.timestamps
    end
  end

  def self.down
    drop_table :rounds
  end
end
