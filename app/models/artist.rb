class Artist

  attr_reader :name, :years_experience
  @@all = []
  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    @@all << self
  end
  #returns array of all artists
  def self.all
    @@all
  end
  # Returns an array all the paintings by an artist
  def paintings
    Painting.all.select{|painting_instance| painting_instance.artist == self}
  end
  # Returns an array of all the galleries that an artist has paintings in
  def galleries
    Painting.all.map do |painting_instance| 
      if painting_instance.artist == self
        painting_instance.gallery
      end
    end.compact.uniq
  end
  # Return an array of all cities that an artist has paintings in
  def cities
    Painting.all.map do |painting_instance| 
      if painting_instance.artist == self
        painting_instance.gallery.city
      end
    end.compact.uniq
  end
  # Returns an integer that is the total years of experience of all artists
  def self.total_experience
    self.all.sum(&:years_experience)
  end
  # Returns an instance of the artist with the highest amount of paintings per year of experience.
  def self.most_prolific
    self.all.max_by{|artist_instance| artist_instance.paintings.length / artist_instance.years_experience}
  end
  # Given the arguments of title, price and gallery, creates a new painting belonging to that artist
  def create_painting(title, price, gallery)
    Painting.new(title, price, gallery, self)
  end
end
