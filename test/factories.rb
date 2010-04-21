Factory.define :hole_information do |hi|
  hi.color "black"
  hi.distance 412
  hi.difficulty 1
end

Factory.define :hole do |h|
  h.position 1
  h.par 3
  h.description "Le plus beau trou du parcours"
  h.handicap 1
end

Factory.define :course do |c|
  c.name "L'albatros - Golf National de France"
  c.description "Le parcours le plsu exigeant, rendez-vous des plus grands pour l'Open de France"
  c.address "Golf National de France - 2 avenue du Golf - 78280 Guyancourt"
  c.par 72
end
