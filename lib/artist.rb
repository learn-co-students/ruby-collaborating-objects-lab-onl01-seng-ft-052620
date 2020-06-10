require 'pry'

class Artist
@@all = []

  attr_accessor :name

  def initialize(name)
    self.name = name
    @@all << self
    @songs = []
    
  end

  def self.all
    @@all
  end

  def add_song(song)
    self.songs << song
    song.artist = self
    
  end

  def songs
    @songs
  end

  def self.find_or_create_by_name(name)
    self.all.detect {|artist| artist.name == name} ||
    self.new(name)
  end

  def print_songs
    songs.each {|song| puts song.name}
    
  end

  


end