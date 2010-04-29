# == Schema Information
# Schema version: 20100423151555
#
# Table name: round_holes
#
#  id         :integer         not null, primary key
#  round_id   :integer
#  score      :integer
#  fairway    :boolean
#  green      :boolean
#  sandsave   :boolean
#  putts      :integer
#  created_at :datetime
#  updated_at :datetime
#

class RoundHole < ActiveRecord::Base
  belongs_to :round
  
  validates_presence_of :score
end
