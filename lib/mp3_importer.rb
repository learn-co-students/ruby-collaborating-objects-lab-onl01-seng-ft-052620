class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        Dir[@path + "/*.mp3"].map {|song| song[(/([^\/]+)\z/)]}
    end

    def import 
        self.files.each {|song_file| Song.new_by_filename(song_file)}
    end
    
end