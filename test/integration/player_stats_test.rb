require 'test_helper'

class PlayerStatsTest < ActionController::IntegrationTest
  def setup
    @course1 = create_course
    @course2 = create_course
    add_round(@course1)
    add_round(@course2)
  end
  
  test "stats index displays standard global stats for player" do
    # Score is two over par on each hole
    expected_avg_score = (@course1.par + @course2.par + (2 * 18 * 2)) / 2
    
    # Navigate to page
    visit stats_path
    
    assert_contain "Average score #{expected_avg_score}"
  end
end