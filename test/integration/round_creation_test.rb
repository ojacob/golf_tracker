require 'test_helper'

class RoundCreationTest < ActionController::IntegrationTest
  def setup
    @course = create_course
  end

  test 'enter a round score card' do
    visit new_round_path
    
    select @course.name, :from => "round_course_id"
    select "Yellow", :from => "round_tee"
    
    18.times do |i|
      fill_in "round_round_holes_attributes_#{i}_score", :with => 4
      fill_in "round_round_holes_attributes_#{i}_putts", :with => 2
      check "round_round_holes_attributes_#{i}_fairway" unless (i % 3 == 0)
    end
    
    rounds_count = Round.count
    click_button 'round_submit'
    assert_equal rounds_count + 1, Round.count
    
    assert_contain "Détail du round"
    
    round = Round.find(:last)
    assert_equal 72, round.score
    assert_equal 2, round.putts
    assert_in_delta 66.66, round.fairways, 0.01
  end
end