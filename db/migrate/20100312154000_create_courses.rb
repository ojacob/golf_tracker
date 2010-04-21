class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.string :name, :null => false
      t.string :description
      t.string :address
      t.integer :par, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
