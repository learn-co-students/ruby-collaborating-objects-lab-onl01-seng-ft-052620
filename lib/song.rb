
class Song 
    @@all = []
    attr_accessor :name, :artist

    def initialize(name)
        @name = name 
        @@all << self 
    end 

    def self.all 
        @@all
    end 

    def self.new_by_filename(file)
        song = self.new(file)
        song.name = file.split(" - ")[1]
        song.artist_name = file.split(" - ")[0]
        song 
    end 

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end 

end 

