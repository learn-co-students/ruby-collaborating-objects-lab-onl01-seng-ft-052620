require 'pry'
class Artist
    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end

    def self.all
        @@all
        # binding.pry
    end

    def add_song(song)
        self.songs << song
    end

    def self.find_or_create_by_name(artist_name)
        found = self.all.find{|artist| artist.name = artist_name}
        if found
            found
        else
            new_artist = self.new(artist_name)
            new_artist
        end
    end

    def print_songs
        @songs.each do |song|
            puts song.name
        end
    end
end