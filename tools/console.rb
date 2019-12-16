require_relative '../config/environment.rb'
a1 = Artist.new("Tom", 5)
a2 = Artist.new("Kelly", 2)
g1 = Gallery.new("Met", "New York")
g2 = Gallery.new("Louvre", "Paris")
a1.create_painting("No1", 300, g1)
a1.create_painting("No2", 600, g1)
a1.create_painting("No3", 400, g2)
a2.create_painting("No1", 900, g1)




binding.pry

puts "Bob Ross rules."
