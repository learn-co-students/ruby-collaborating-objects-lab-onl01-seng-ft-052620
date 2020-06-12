require 'pry'
class Song
  attr_accessor :name, :artist
  
    @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.new_by_filename(filename)
    # filename ==> "Black Sabbath - Changes - pop.mp3"
      filename_array = filename.split(" - ")
     
    # ["Black Sabbath", "Changes, pop.mp3"]
    song = self.new(filename_array[1])
    artist_name = (filename_array[0])
    song.artist_name=(artist_name)
    song
  end
  
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end
end