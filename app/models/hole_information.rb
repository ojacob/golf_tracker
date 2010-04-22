# == Schema Information
# Schema version: 20100422143334
#
# Table name: hole_informations
#
#  id         :integer         not null, primary key
#  color      :string(255)
#  distance   :integer
#  hole_id    :integer
#  difficulty :integer
#  created_at :datetime
#  updated_at :datetime
#

class HoleInformation < ActiveRecord::Base
  belongs_to :hole
  
  validates_inclusion_of :color, :in => %w{ black white yellow blue red }
end
