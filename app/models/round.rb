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
    self.round_holes.average(:putts)
  end
  
  def fairways
    (self.round_holes.collect { |rh| rh.fairway }.count / self.round_holes.count) / 100
  end
end
