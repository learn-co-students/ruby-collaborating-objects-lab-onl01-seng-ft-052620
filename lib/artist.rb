require "pry"
class Artist 
attr_accessor :name, :song, :all, :songs

@@all = []
def initialize(name)
  @name = name 
  @@all << self
end 
  
  def self.all 
     @@all
  end
  
  def add_song(song)
    binding.pry
  self.songs = song
  
  end
  
  
end 