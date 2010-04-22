# == Schema Information
# Schema version: 20100422143334
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
end
