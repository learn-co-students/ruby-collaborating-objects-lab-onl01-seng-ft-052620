require 'pry'

class Song
attr_accessor :name, :artist
@@all = []
def initialize(name)
    @name = name
    save
end

def save
    @@all << self
end
def self.all
    @@all
end
def self.new_by_filename(file_name)
    file = file_name.split(" - ")
    song = self.new(file[1])
   song.artist_name = file[0]
   song
  end
  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    self.artist.add_song(self)
    end
end