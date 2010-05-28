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
  include AASM
  
  belongs_to :course
  has_many :round_holes, :dependent => :destroy
  accepts_nested_attributes_for :round_holes
  
  named_scope :done, :conditions => "current_state = 'done'"
  
  ####################
  # AASM definitions
  ####################
  
  aasm_column :current_state
  aasm_initial_state :created
  
  aasm_state :created
  aasm_state :course_selected # Course on which the round has been played has been selected
  aasm_state :done # User entered his score for this round
  
  aasm_event :select_course, :before => :validate_course, :after => :build_holes do
    transitions :to => :course_selected, :from => [:created], :guard => Proc.new { |o| o.errors.empty? }
  end
  
  aasm_event :score_entered do
    transitions :to => :done, :from => [:course_selected]
  end

  def validate_course
    self.errors.add(:course_id, :blank, :default => nil) if self.course_id.blank?
    self.errors.add(:played_on, :blank, :default => nil) if self.played_on.blank?
  end

  def build_holes
    self.course.holes.each do |h|
      self.round_holes.build(:position => h.position)
    end
  end

  #########
  # Stats
  #########
  
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
