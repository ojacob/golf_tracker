require 'test_helper'

class HoleTest < ActiveSupport::TestCase
  def setup
    @hole = Factory :hole
    @hole.hole_informations.create(:color => "black", :distance => 500)
    @hole.hole_informations.create(:color => "white", :distance => 480)
  end
  
  test "get information by color" do
    assert_equal 500, @hole.info("black").distance
  end
end
