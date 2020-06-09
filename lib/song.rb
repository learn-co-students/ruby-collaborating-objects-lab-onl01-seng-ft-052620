class Song

    attr_accessor :name, :artist, :genre

    @@all = []

    def initialize(name)
        @name = name
        self.save
    end

    def self.new_by_filename(filename)
        parse = filename.sub!(".mp3","").split('-')
        song = Song.new(parse[1].strip)
        song.genre = parse[2].strip
        song.artist_name = parse[0].strip
        song
    end

    def self.all
        @@all
    end

    def save
        Song.all << self
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end
end