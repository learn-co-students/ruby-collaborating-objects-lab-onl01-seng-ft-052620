class Song
#this class will be responsible for creating songs given each filename & sending the artist's name (a string) to the Artist class

    @@all = [] #store all song instances in this variable
    attr_accessor :name, :artist

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        # binding.pry
        file = filename.split(" - ")
        new_song = Song.new(file[1])
        new_song.artist_name=(file[0])
        new_song
        #this method will do FOUR things
        #1. parse filename to find the song & artist name (every file separates the song & artist with " - ")
        #2. create a new song instance Song.new, array[1]
        #3. want to associate the new song with an artist (array[0]) using @artist
        #4. return the new song instance - this will use #artist_name=
    end

    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
        #this method will do TWO things
        #1. turn the artists name as a string into an Artist object
            #either create an Artist instance OR
            #it already exists and we need to find that Artist instance
        #2. assign the song to the artist
        #once we have the artist instance, we want to collaborate with Artist class & call Artist#add_song(self)
    end

end