# == Schema Information
# Schema version: 20100419201027
#
# Table name: hole_informations
#
#  id         :integer         not null, primary key
#  color      :string(255)
#  distance   :integer
#  hole_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class HoleInformation < ActiveRecord::Base
  belongs_to :hole
end
