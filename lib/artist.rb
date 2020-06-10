require 'pry'
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

  def add_song(song)
    song.artist = self
  end

  def songs
    Song.all.select {|song| song.artist == self }
  end
  

  def self.all
    @@all
  end


  def self.find_or_create_by_name(name)
    if self.all.any? {|artist| artist.name == name}
      all.detect {|i| i.name == name}
    else
    artist = Artist.new(name)
    end
  end

  def print_songs
   songs.each {|i| puts i.name}
   
  end
  
end