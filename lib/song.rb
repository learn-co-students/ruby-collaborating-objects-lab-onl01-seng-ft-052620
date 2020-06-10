class Song
    attr_accessor :artist, :name
    @@all = []
    
def initialize(name)
    @name = name
    @@all << self
end

def self.all
    @@all
end

def self.new_by_filename(file_name)
    formatted_name = file_name.split(" - ")
    song = self.new(formatted_name[1])
    song.artist_name = (formatted_name[0])
    song
end

def artist_name=(string)
    artist = Artist.find_or_create_by_name(string)
    artist.add_song(self)
end


end