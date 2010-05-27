require 'test_helper'

class RoundCreationTest < ActionController::IntegrationTest
  def setup
    @course = create_course
  end

  test 'enter a round score card' do
    rounds_count = Round.count
    
    visit new_round_path
    
    # Round is created directly to start the state machine
    assert_equal rounds_count + 1, Round.count
    
    # First screen
    select @course.name, :from => "round_course_id"
    fill_in :round_played_on, :with => Time.now.strftime('%d %B %Y')
    select "Yellow", :from => "round_tee"
    
    click_button "round_submit"
    
    # Second screen
    18.times do |i|
      fill_in "round_round_holes_attributes_#{i}_score", :with => 4
      fill_in "round_round_holes_attributes_#{i}_putts", :with => 2
      check "round_round_holes_attributes_#{i}_fairway" unless (i % 3 == 0)
    end
    
    click_button "round_submit"
    
    assert_contain "L'albatros - Golf National de France, played on #{I18n.localize(Time.now.to_date, :format => :long)}"
    
    round = Round.find(:last)
    assert_equal 72, round.score
    assert_equal 36, round.putts
    assert_in_delta 66.66, round.fairways_avg, 0.01
  end
  
  test 'cannot enter score without course and date' do
    visit new_round_path
    
    select @course.name, :from => "round_course_id"
    click_button "round_submit"
    
    assert_contain "Round played on must be filled in"
  end
end