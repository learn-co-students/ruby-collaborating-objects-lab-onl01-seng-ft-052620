class Artist
	@@all = []
	attr_accessor :name

	def initialize(name)
		@name = name
		@@all << self
	end

	def self.all
		@@all
	end

	def self.find_or_create_by_name(name)
		artist_with_name = self.all.detect{|artist| artist.name == name}
		artist_with_name ? artist_with_name : self.new(name)  
	end

	def add_song(song)
		song.artist = self
	end

	def songs
		Song.all.select{|song| song.artist == self}
	end

	def print_songs
		self.songs.each{|song| puts song.name}
	end
end