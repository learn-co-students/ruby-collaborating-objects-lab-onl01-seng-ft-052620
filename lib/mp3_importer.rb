require 'pry'
require_relative 'artist'
require_relative 'song'


class MP3Importer

    attr_accessor :path, :files

    def initialize(filepath)
        @path = filepath
        @files = []
        Dir.foreach(self.path) do |file|
            if file.to_s.include?(".mp3")
                self.files << file
            end
        end
    end

   

    def import
        @files.each do |file|
            Song.new_by_filename(file)
        end
    end


    

end