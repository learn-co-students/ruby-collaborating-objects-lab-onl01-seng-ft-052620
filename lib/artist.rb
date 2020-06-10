class Artist
#this class will be responsible for either creating the artist (if they don't exist in the program yet) or finding the instance of that artist (if they do exist)

    attr_accessor :name


    @@all = [] #store all Artist instance in this variable

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
       @@all 
    end

    def add_song(song)
        song.artist = self
        #receivece an instance of Song and associates it (belongs to) this Artist instance
    end

    def songs
        Song.all.select { |song| song.artist == self }
        #return an array of all songs that belong to this Artist instance - should get all existing Song instance from Song & select only the ones associated with this Artist - need to iterate over Song.all
        
    end

    def self.find_or_create_by_name(name)
        artist = self.all.detect { |artist| artist.name == name }
        artist ? artist : self.new(name)
        #name will be a string. one of two things will happen
        #1. find the artist instance that has that name OR
        #2. create one if it doesn't exist

    end

    def print_songs
        self.songs.each { |song| puts song.name }
        #outputs the names of all songs associated with this Artist instance (using self.all, likely) - need to iterate over self.songs
    end

end