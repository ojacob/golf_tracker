########################
# Create some courses
########################

names = ["L'aigle", "L'albatros", "Paris International Golf Club"]
pars = [4, 4, 4, 3, 4, 3, 5, 4, 4, 3, 4, 4, 3, 4, 5, 4, 5, 4]
handicaps = [12, 2, 18, 16, 6, 14, 10, 8, 4, 9, 11, 1, 17, 5, 15, 3, 13, 7]
distances = {
  "black" => [350, 395, 261, 158, 388, 176, 491, 360, 344, 206, 371, 337, 162, 384, 451, 324, 459, 344],
  "white" => [350, 395, 261, 158, 388, 176, 491, 360, 344, 206, 371, 337, 162, 384, 451, 324, 459, 344],
  "yellow" => [312, 373, 254, 153, 378, 169, 481, 355, 335, 192, 360, 330, 152, 363, 435, 324, 449, 327],
  "blue" => [302, 357, 210, 107, 321, 115, 435, 306, 294, 155, 326, 310, 126, 348, 370, 306, 399, 301],
  "red" => [282, 342, 205, 107, 316, 110, 395, 294, 284, 148, 326, 292, 116, 348, 360, 296, 373, 283]
}

names.each do |name|
  course = Course.new(:name => name, :par => 72)
  course.description = "One of the most outstanding golf course in the entire world !! Playing this course is always a real pleasure."
  pars.each_with_index do |par, i|
    course.holes.build(:par => par, :position => i+1, :handicap => handicaps[i])
  end
  distances.each do |color, dists|
    dists.each_with_index do |d, i|
      course.holes[i].hole_informations.build(:color => color, :distance => d)
    end
  end

  course.save!
end

##########################
# Enter some results
##########################

["L'aigle", "Paris International Golf Club"].each do |course_name|
  course = Course.find_by_name(course_name)
  round = Round.create
  round.course_id = course.id
  round.played_on = Time.now.strftime('%B %d %Y')
  round.save
  round.select_course!
  
  round.tee = "Yellow"
  course.holes.each do |hole|
    rh = round.round_holes.build
    rh.position = hole.position
    rh.score = 4
    rh.fairway = true
    rh.green = true
    rh.sandsave = false
    rh.putts = 2
  end

  round.save
  round.score_entered!
end