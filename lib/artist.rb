class Artist
    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        # accepts a name for the artist
        @name = name
        save
    end

    def save
        # saves each instance of an artist to an array called @@all
        @@all << self
    end

    def self.all
        # returns all existing Artist instances
        @@all
    end

    def add_song(song)
        #keeps track of an artist's songs
        song.artist = self
    end

    def songs
        Song.all.select{|song| song.artist == self}
    end

    def self.find_or_create_by_name(name) # => an instance of Artist
        # finds or creates an artist by name maintaining uniqueness of objects name property
        # Creates a new instance of Artist if none exist
        
        if !self.all.any?{|artist| artist.name == name}
            self.new(name)
        else
            self.all.find{|artist| artist.name == name}
        end

    end

    def songs
        Song.all.select{|song| song.artist == self}
    end

    def print_songs
        # lists all of the artist's songs
        songs.each{|song| puts song.name}
    end
end