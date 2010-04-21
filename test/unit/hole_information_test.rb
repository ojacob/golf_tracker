require 'test_helper'

class HoleInformationTest < ActiveSupport::TestCase
  test "accepts only valid tee shot color" do
    assert info_with_color("black").valid?
    assert info_with_color("white").valid?
    assert info_with_color("yellow").valid?
    assert info_with_color("blue").valid?
    assert info_with_color("red").valid?
    
    assert_raise ActiveRecord::RecordInvalid do
      info_with_color("pink")
    end
    assert_raise ActiveRecord::RecordInvalid do
      info_with_color("purple")
    end
    assert_raise ActiveRecord::RecordInvalid do
      info_with_color("grey")
    end
  end
  
private
  def info_with_color(color)
    Factory :hole_information, :color => color
  end
end
