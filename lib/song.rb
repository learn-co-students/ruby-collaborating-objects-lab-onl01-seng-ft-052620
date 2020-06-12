class Song
attr_accessor :name, :artist
@@all = []
def initialize(name)
  @name = name
  @@all << self
end



def self.new_by_filename(filename)
  @file_info = filename.split(" - ")
  @new_song = Song.new(@file_info[1])
  @new_artist = Artist.find_or_create_by_name(@file_info[0])
  @new_song.artist = @new_artist
  @new_artist.songs << @new_song
  @new_song
end

def self.all
@@all
end

def artist_name=(artist_name)
  self.artist = Artist.find_or_create_by_name(artist_name)
end


end
