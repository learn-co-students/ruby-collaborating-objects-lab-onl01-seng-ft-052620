require 'pry'

class Song
 attr_accessor :name, :artist

 @@all =[]
 
def initialize(name)
    @name =name
    save
end

def self.new_by_filename(file)
    file = file.split(' - ').map{|each|each.strip}
    song = file[1]
    artist = file[0]
    new_song = self.new(song)
    new_song.artist_name= artist
    new_song
end

def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by_name(artist_name)
    artist.add_song(self)
end
def save 
    @@all << self
end

def self.all
    @@all
end

end