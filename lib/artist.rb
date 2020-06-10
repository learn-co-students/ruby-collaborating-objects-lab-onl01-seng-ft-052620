class Artist
  
  @@all = []
  
  attr_accessor :name, :songs
  
  def initialize(name)
  @name = name
  @@all << self
  @songs = []
  end
  
  def self.all
    @@all
  end
  
  def add_song(song)
    song.artist = self
    @songs << song
    
  end
  
  def self.find_or_create_by_name(name)
    artistss = @@all.detect {|artist| artist.name == name}
    if artistss
      artistss
    else
      self.new(name)
    end
  end
  
  def print_songs
    @songs.each do |song|
      puts song.name
    end
  end
  
    
    
  
  
end