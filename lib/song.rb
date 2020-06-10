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

  def self.new_by_filename(filename)
    song = self.new(filename.split(" - ")[1])
    song.artist_name=(filename)
    song
  end

  def artist_name=(filename)
    artist_str = filename.split(" - ")[0]
    artist_instance = Artist.find_or_create_by_name(artist_str)
    artist_instance.add_song(self)

    # if (self.artist.nil?)
    #   self.artist = Artist.new(artist_name)
    # else
    #   self.artist.name = artist_name
    # end
    # self.artist.add_song(self)
  end
end
