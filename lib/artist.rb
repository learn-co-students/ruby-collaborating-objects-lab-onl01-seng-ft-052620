require 'pry'
require_relative 'song'
class Artist

    attr_accessor :name, :songs
    @@all = []

    def initialize(name)
        self.name = name
        self.songs = []
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
        @songs << song
    end

    def songs
        @songs
    end

    def self.find_or_create_by_name(name)
        output = @@all.find {|artist| artist.name == name}
        if output.nil?
            output = Artist.new(name)
        end
        output
    end

    def print_songs
        @songs.each do |song|
            puts song.name
        end
    end



end