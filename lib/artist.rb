require "pry"

class Artist 
  attr_accessor :name 
  @@all = []
  
  def initialize(name)
    @name = name
    save
  end 
  
  def save
    @@all << self
  end
  
  def self.all
    @@all 
  end 
  
  def add_song(song)
   song.artist = self
  end 
  
  def songs 
    Song.all.select{|song| song.artist == self}
  end 
  
  def self.find_or_create_by_name(s_name)
    if Artist.all.any? {|artist| artist.name = s_name}
      Artist.all.detect {|artist| artist.name = s_name}
    else
      artist = Artist.new(s_name)
    end 
  end
  
  def print_songs
    puts self.songs.collect{|song| song.name}.join("\n")
  end 

end 


