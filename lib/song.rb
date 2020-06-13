class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.new_by_filename(filename)
        split_name = filename.split(" - ")
        song = self.new(split_name[1])
        artist = Artist.find_or_create_by_name(split_name[0])
        song.artist = artist
        artist.add_song(song)
        song
    end

    # accepts an artist's name, finds or creates an Artist instance and assigns it to the Song's artist attribute
    def  artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
    end

    def self.all
        @@all
    end
end


    # sets the artist object to belong to the song / attr_reader
    #does the following with the "unless" so that it doesn't fall into an infinite loop
    # if artist is nil or false, then run @artist = artist
    # 2nd unless author is already included in array of books, run artist.add_song(self)
    # def artist=(artist)
    #     @artist = artist unless @artist
    #     artist.add_song(self) unless artist.songs.include?(self)
    # end