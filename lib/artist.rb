class Artist

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def add_song(song)
    song.artist = self
  end

  def songs
    new_array = []
    Song.all.each do |song|
      if song.artist == self
        new_array << song
      end
    end
    new_array
  end

  def self.find_or_create_by_name(name)
    @@all.each do |artist|
      if artist.name == name
        return artist
      end
    end
    return self.new(name)
  end

  def print_songs
    songs.each do |song|
      puts song.name
    end
  end


end



# @@all.each do |artist|
#   if artist.name == name
#     return artist
#   else
#     self.new(name)
#   end
# end
