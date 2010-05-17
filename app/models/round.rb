# == Schema Information
# Schema version: 20100423151555
#
# Table name: rounds
#
#  id         :integer         not null, primary key
#  course_id  :integer
#  tee        :string(255)
#  played_on  :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Round < ActiveRecord::Base
  belongs_to :course
  has_many :round_holes, :dependent => :destroy
  accepts_nested_attributes_for :round_holes
  
  validates_presence_of :course_id, :tee

  def score
    self.round_holes.sum(:score)
  end
  
  def putts
    self.round_holes.sum(:putts)
  end
  
  def greens
    self.round_holes.select { |rh| rh.green }.count
  end
  
  def fairways_avg
    (self.round_holes.select { |rh| rh.fairway }.count.to_f / self.round_holes.count) * 100
  end
  
  def fairways
    self.round_holes.select { |rh| rh.fairway }.count
  end
end
