require 'pry'

class MP3Importer

    

    attr_accessor :path 

    def initialize(path)
        @path = path
        @list_filenames = []
    end

    def files
        # loads all the mp3 files in the path directory
        # normalizes the filename to just the mp3 filename with no path
        @list_filenames = Dir[@path+"/*.mp3"]
       
        
        @list_filenames = @list_filenames.collect{|file| file.split("./spec/fixtures/mp3s/")}.flatten
        
        
        @list_filenames.reject{|c| c == ""}
        
        
        
        
    end

    def import
        # imports the files into the library by creating songs from a filename
        files.each{|filename| Song.new_by_filename(filename)}

    end
end