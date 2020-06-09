class Song
	@@all = []
	attr_accessor :name, :artist

	def initialize(name)
		@name = name
		@@all << self
	end

	def self.all
		@@all
	end

	def self.new_by_filename(filename)
		#filename example "Action Bronson - Larry Csonka - indie.mp3"
		file_ary = filename.split(" - ")
		new_song = self.new(file_ary[1])
		new_song.artist_name = file_ary[0]
		self.all << new_song
		new_song
	end

	def artist_name=(name)
		#a method that takes in the name and gets the artist object and associates self with the artist
		artist = Artist.find_or_create_by_name(name) 
		artist.add_song(self)
	end
end