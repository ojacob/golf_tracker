# == Schema Information
# Schema version: 20100423151555
#
# Table name: holes
#
#  id          :integer         not null, primary key
#  position    :integer         not null
#  par         :integer         not null
#  description :string(255)
#  handicap    :integer         not null
#  course_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Hole < ActiveRecord::Base
  belongs_to :course
  has_many :hole_informations, :order => "difficulty", :dependent => :destroy
  
  validates_presence_of :par, :position, :handicap
  accepts_nested_attributes_for :hole_informations
  
  def info(color)
    self.hole_informations.detect { |info| info.color == color.downcase }
  end
end
