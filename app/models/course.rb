# == Schema Information
# Schema version: 20100423151555
#
# Table name: courses
#
#  id          :integer         not null, primary key
#  name        :string(255)     not null
#  description :string(255)
#  address     :string(255)
#  par         :integer         not null
#  created_at  :datetime
#  updated_at  :datetime
#

class Course < ActiveRecord::Base
  has_many :holes, :dependent => :destroy
  
  validates_presence_of :name, :par
  
  accepts_nested_attributes_for :holes
end
