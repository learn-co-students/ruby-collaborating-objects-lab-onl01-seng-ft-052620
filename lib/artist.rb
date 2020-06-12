class Artist 
attr_accessor :name, :songs, :artist
  @@song_count = 0
  @@all
  def initialize(name)
    @name = name
    @songs = [] 
    @@all << self 
  end

  def songs
    @songs
  end
  def self.all 
   @@all  
  end

  def add_song(song)
    @songs << song
    song.artist = self
    @@song_count += 1
  end

  def add_song_by_filename(filename)
    song = Song.new(filename)
    @songs << song
    song.artist = self
    @@song_count += 1
  end
  def  self.find_or_create_by_name(artist_name)
    found_artist = self.all.find {|artist| artist.name == artist_name}
    if found_artist
      found_artist
    else
      new_artist = self.new(artist_name)
      new_artist
    end
  end

def print_songs 
self.songs.each  do |artist,name| 
  puts artist.name 
end 
end 

  def self.song_count
    @@song_count
  end

end 