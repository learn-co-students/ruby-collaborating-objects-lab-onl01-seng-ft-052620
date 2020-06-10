class Song
  attr_accessor :name, :artist
  
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

  def self.new_by_filename(files)
    split_file = files.split(' - ')
    song = Song.new(split_file[1])
    artist = Artist.find_or_create_by_name(split_file[0])
    song.artist = artist
    song
  end

  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    self.artist = artist
    binding.pry
  end
end