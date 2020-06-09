class Artist

    attr_accessor :name,:songs

    @@all = []

    def initialize(name)
        @name = name
        self.save
    end
    
    def self.all
        @@all
    end

    def save
        Artist.all << self
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def self.find_or_create_by_name(name)
        if rtn = Artist.all.find {|artist| artist.name == name}
            rtn
        else
            Artist.new(name)
        end
    end

    def print_songs
        self.songs.each {|song| puts song.name}
    end
end