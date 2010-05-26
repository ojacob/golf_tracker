module RoundsHelper
  # Displays information about the hole linked to the given RoundHole
  def round_hole_information(round_hole)
    info = ""
    info << content_tag(:td, hole_distance(round_hole).to_s)
    info << content_tag(:td, hole_par(round_hole).to_s)
  end
  
private
  def get_hole(round_hole)
    round_hole.round.course.holes[round_hole.position - 1]
  end
  
  def hole_distance(round_hole)
    hole = get_hole(round_hole)
    hole.info(round_hole.round.tee).distance
  end
  
  def hole_par(round_hole)
    get_hole(round_hole).par
  end
end