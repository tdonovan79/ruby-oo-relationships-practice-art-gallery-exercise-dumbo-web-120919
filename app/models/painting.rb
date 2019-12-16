class Painting

  attr_reader :title, :price, :gallery, :artist

  @@all = []

  def initialize(title, price, gallery, artist)
    @title = title
    @price = price
    @gallery = gallery
    @artist = artist
    @@all << self
  end
  # Returns an array of all the paintings
  def self.all
    @@all
  end
  # Returns an integer that is the total price of all paintings
  def self.total_price
    self.all.sum(&:price)
  end
end