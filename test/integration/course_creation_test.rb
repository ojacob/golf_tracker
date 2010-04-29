require 'test_helper'

class CourseCreationTest < ActionController::IntegrationTest
  test "create a new 18 holes golf course" do    
    visit new_course_path
    fill_in "course_name", :with => "L'aigle"
    fill_in "course_par", :with => 72
    
    
    
    18.times do |i|
      fill_in "hole_#{i+1}_par", :with => PARS[i]
      fill_in "hole_#{i+1}_handicap", :with => HANDICAPS[i]
      DISTANCES.each do |color, dists|
        fill_in "hole_#{i+1}_info_#{color}", :with => dists[i]
      end
    end

    click_button 'Create'
    assert_contain 'Course was successfully created.'
    
    # Assertions on course content
    course = Course.find_by_name("L'aigle")
    assert !course.nil?
    assert_equal 72, course.par
    assert_equal 18, course.holes.size
    course.holes.each_with_index do |hole, i|
      assert_equal PARS[i], hole.par
      assert_equal HANDICAPS[i], hole.handicap
      DISTANCES.each do |color, dists|
        assert_equal dists[i], hole.info(color).distance
      end
    end
  end
  
  test "update course card" do
    course = create_course
    
    visit edit_course_path(course)
    
    fill_in "hole_2_par", :with => 3
    fill_in "hole_2_handicap", :with => 16
    fill_in "hole_4_par", :with => 4
    fill_in "hole_4_handicap", :with => 2
    fill_in "hole_6_info_white", :with => 180
    
    click_button "Save"
    
    assert_equal 3, course.reload.holes[1].par
    assert_equal 16, course.holes[1].handicap
    assert_equal 4, course.holes[3].par
    assert_equal 2, course.holes[3].handicap
    assert_equal 180, course.holes[5].info("white").distance
  end
end
