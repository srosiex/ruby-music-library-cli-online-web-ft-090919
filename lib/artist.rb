class Artist
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
    @songs = []
  end

  def self.all
    @@all
  end
  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end
  
  def self.create(name)
    Artist.new(name)
  end

  def add_song(song)
    self.songs << song
    song.artist = self
  end


  def songs
    @songs
end


end
