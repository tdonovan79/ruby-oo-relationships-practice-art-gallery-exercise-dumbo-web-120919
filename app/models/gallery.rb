class Gallery

  attr_reader :name, :city
  @@all = []
  def initialize(name, city)
    @name = name
    @city = city
    @@all << self
  end
  # Returns an array of all the galleries
  def self.all
    @@all
  end
  # Returns an array of all paintings in a gallery
  def paintings
    Painting.all.select{|painting_instance| painting_instance.gallery == self}
  end
  #Returns an array of all artists that have a painting in a gallery
  def artists
    Painting.all.map do |painting_instance| 
      if painting_instance.gallery == self
        painting_instance.artist
      end
    end.compact.uniq
  end
  # Returns an array of the names of all artists that have a painting in a gallery
  def artist_names
    self.artists.map(&:name)
  end
  def most_expensive_painting
    self.paintings.max_by(&:price)
  end
end
