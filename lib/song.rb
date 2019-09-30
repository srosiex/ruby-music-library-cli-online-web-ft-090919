class Song
attr_accessor :name, :artist, :genre
# attr_reader :artist
  @@all = []

  def initialize(name, artist=nil, genre=nil)
    @name = name
    @@all << self
    self.artist=(artist) unless artist == nil
    self.genre=(genre) unless genre == nil

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
  def self.create(song, artist=nil, genre=nil)
    song = Song.new(song, artist, genre)
    song.save
    song
  end
  def artist=(artist)
    @artist = artist
  artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self  unless genre.songs.include?(self)
  end

end
