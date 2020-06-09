require 'pry'

class Artist
attr_accessor :name, :songs

    @@all =[]

    def initialize(name)
        @name=name
        @songs =[]
        save  
    end

    def add_song(song)
        song.artist = self
        self.songs << song
    end   

    def self.find_or_create_by_name(artist_name)
        # Artist.all.any?{|artist| artist.name == name} ? Artist.all.select{|artist| artist if artist.name == name}[0] : Artist.new(name)
        found_artist = self.all.find {|artist| artist.name == artist_name}
        if found_artist
          found_artist
        else
          new_artist = self.new(artist_name)
        end
    end

    def print_songs
       self.songs.each{|song| puts song.name}
    end

    def save 
        @@all << self
    end

    def self.all
        @@all
    end


end