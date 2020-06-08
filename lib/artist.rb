class Artist
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def self.find_by_name(artist_name)
        self.all.find {|artist| artist.name == artist_name}
    end

    def self.create_by_name(artist_name)
        artist = Artist.new(artist_name)
        artist
    end

    def self.find_or_create_by_name(artist_name)
        self.find_by_name(artist_name) || self.create_by_name(artist_name)
    end

    def print_songs
        puts songs.map {|song| song.name}
    end
end