require 'pry'

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
    song.artist = Artist.find_or_create_by_name(formatted_name[0])
end
# binding.pry

end