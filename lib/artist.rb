class Genre
  attr_accessor :name, :musiclibrarycontroller, :musicimporter
  attr_reader :songs
  extend Concerns::Findable
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
     artist = new(name)
     artist.save
     artist
   end

  def songs
    @songs
  end

  def artists
    @new_array = []
    @songs.each do |song|
      if @new_array.include?(song.artist)
        nil
      else
        @new_array << song.artist
      end
    end
    @new_array
  end

  def add_song(song)
      song.artist = self unless song.artist
      songs << song unless songs.include?(song)
    end
    def genres
   songs.collect{ |s| s.genre }.uniq
 end


end
