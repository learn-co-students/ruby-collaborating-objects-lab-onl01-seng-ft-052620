require 'pry'

class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save # saves all Song instances into @@all
        @@all << self
    end

    def self.all
        # returns all existing Song instances
        @@all
        
    end

    def self.new_by_filename(filename)
        # creates new instance of a song from the file that's passed
        # associates new song instance with the artist from the filename
        artist_song = filename.split(" - ")
        new_song = Song.new(artist_song[1])
        new_song.artist_name = artist_song[0]
        new_song

    end

    def artist_name= (name)
        # finds or creates an Aritst instance and assigns it to the Song's
        # artist attribute
        found_artist = Artist.all.find{|artist| artist.name == name}
        if found_artist.nil?
            found_artist = Artist.new(name)
            self.artist = found_artist
        else
            
            self.artist = found_artist
            self.artist
        end


    end

end