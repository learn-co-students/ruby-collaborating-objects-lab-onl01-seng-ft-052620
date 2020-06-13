class Artist
    attr_accessor :name, :songs
    attr_writer :artist

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end
    
    # sets the artist object to belong to the song
    # def add_song(song_object)
        # self.song << song_object
        # song_object.artist = self
    # end

    def add_song(song)
        @songs << song
    end

    def songs
        @songs
    end

    def self.find_or_create_by_name(name)
       self.all.detect {|artist| artist.name == name} || Artist.new(name)
    end

    def print_songs
        @songs.each {|song| puts song.name}
    end

    def self.all
        @@all
    end

end
