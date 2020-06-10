require 'pry'

class Artist
attr_accessor :name
@@all = []
def initialize(name)
 @name = name   
 @@all << self
 @songs = []

end

def self.all
    @@all 
end

def add_song(song)
    @songs << song
    song.artist = self
   end
 
def songs
    @songs
end
def self.find_or_create_by_name(name)
 find_name = @@all.find  {|artist| artist.name == name }
    find_name ? find_name : self.new(name)

 end
def print_songs
    songs.each {|song| puts song.name}
end
 

end