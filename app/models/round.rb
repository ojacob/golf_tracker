# == Schema Information
# Schema version: 20100422143334
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
end
