class CreateRounds < ActiveRecord::Migration
  def self.up
    create_table :rounds do |t|
      t.integer :course_id
      t.string :tee
      t.datetime :played_on
      t.string :current_state # AASM state column

      t.timestamps
    end
  end

  def self.down
    drop_table :rounds
  end
end
