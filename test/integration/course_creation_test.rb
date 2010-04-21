require 'test_helper'

class CourseCreationTest < ActionController::IntegrationTest
  def setup
    @pars = [4, 4, 4, 3, 4, 3, 5, 4, 4, 3, 4, 4, 3, 4, 5, 4, 5, 4]
    @handicaps = [12, 2, 18, 16, 6, 14, 10, 8, 4, 9, 11, 1, 17, 5, 15, 3, 13, 7]
    @distances = {
      "black" => [350, 395, 261, 158, 388, 176, 491, 360, 344, 206, 371, 337, 162, 384, 451, 324, 459, 344],
      "white" => [350, 395, 261, 158, 388, 176, 491, 360, 344, 206, 371, 337, 162, 384, 451, 324, 459, 344],
      "yellow" => [312, 373, 254, 153, 378, 169, 481, 355, 335, 192, 360, 330, 152, 363, 435, 324, 449, 327],
      "blue" => [302, 357, 210, 107, 321, 115, 435, 306, 294, 155, 326, 310, 126, 348, 370, 306, 399, 301],
      "red" => [282, 342, 205, 107, 316, 110, 395, 294, 284, 148, 326, 292, 116, 348, 360, 296, 373, 283]
    }
    
    @course = Factory :course
    @pars.each_with_index do |par, position|
      @course.holes << (Factory :hole, :par => par, :position => position+1)
    end
    @distances.each do |color, dists|
      dists.each_with_index do |d, i|
        @course.holes[i].hole_informations.create(:color => color, :distance => d)
      end
    end
  end

  test "create a new 18 holes golf course" do    
    visit new_course_path
    fill_in "Name", :with => "L'aigle"
    fill_in "Par", :with => 72
    
    18.times do |i|
      fill_in "hole_#{i+1}_par", :with => @pars[i]
      fill_in "hole_#{i+1}_handicap", :with => @handicaps[i]
    end

    click_button 'Create'
    assert_contain 'Course was successfully created.'
  end
  
  test "update course card" do
    visit edit_course_path(@course)
    
    fill_in "hole_2_par", :with => 3
    fill_in "hole_2_handicap", :with => 16
    fill_in "hole_4_par", :with => 4
    fill_in "hole_4_handicap", :with => 2
    
    click_button "Save"
    
    assert_equal 3, @course.reload.holes[1].par
    assert_equal 16, @course.reload.holes[1].handicap
    assert_equal 4, @course.holes[3].par
    assert_equal 2, @course.reload.holes[3].handicap
  end
end
