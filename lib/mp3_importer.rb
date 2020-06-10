class MP3Importer
#this class will parse filenames & send them to the Song class

    attr_accessor :path

    def initialize(path)
        @path = path
        #should have a path attribute that is set
    end

    def files
        Dir[path + "/*.mp3"].map { |mp3| mp3.delete_prefix(path + "/") }
        # binding.pry
    end

    def import
        self.files.each { |filename| Song.new_by_filename(filename) }
    end


end