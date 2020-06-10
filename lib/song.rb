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

    def self.new_by_filename(file_name)
        playlist = file_name.split(" - ")
        artist = playlist[0]
        name = playlist[1]
        #  binding.pry
        song = Song.new(name)
        song.artist_name = artist
        song
    end 
    
    def artist_name=(name)
        @artist = Artist.find_or_create_by_name(name)
    end 
end 