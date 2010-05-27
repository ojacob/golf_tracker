module CoursesTest
  PARS = [4, 4, 4, 3, 4, 3, 5, 4, 4, 3, 4, 4, 3, 4, 5, 4, 5, 4]
  HANDICAPS = [12, 2, 18, 16, 6, 14, 10, 8, 4, 9, 11, 1, 17, 5, 15, 3, 13, 7]
  DISTANCES = {
    "black" => [350, 395, 261, 158, 388, 176, 491, 360, 344, 206, 371, 337, 162, 384, 451, 324, 459, 344],
    "white" => [350, 395, 261, 158, 388, 176, 491, 360, 344, 206, 371, 337, 162, 384, 451, 324, 459, 344],
    "yellow" => [312, 373, 254, 153, 378, 169, 481, 355, 335, 192, 360, 330, 152, 363, 435, 324, 449, 327],
    "blue" => [302, 357, 210, 107, 321, 115, 435, 306, 294, 155, 326, 310, 126, 348, 370, 306, 399, 301],
    "red" => [282, 342, 205, 107, 316, 110, 395, 294, 284, 148, 326, 292, 116, 348, 360, 296, 373, 283]
  }
  
  def create_course
    params = {
      :name => "L'albatros - Golf National de France",
      :description => "Le parcours le plus exigeant, rendez-vous des plus grands pour l'Open de France",
      :address => "Golf National de France - 2 avenue du Golf - 78280 Guyancourt",
      :par => 72
    }

    course = Course.create(params)
    PARS.each_with_index do |par, position|
      course.holes << Hole.new(:par => par, :position => position+1, :handicap => HANDICAPS[position])
    end
    DISTANCES.each do |color, dists|
      dists.each_with_index do |d, i|
        course.holes[i].hole_informations.create(:color => color, :distance => d)
      end
    end
    return course
  end
end
