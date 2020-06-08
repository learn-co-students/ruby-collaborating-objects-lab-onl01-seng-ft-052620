class MP3Importer
    attr_accessor :path

    @@all = []

    def initialize(path)
        @path = path
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
    
    def files
        filenames = Dir.chdir(@path) do | path |
            Dir.glob("*.mp3")
        end
        filenames
    end
    

    def import
        files.map {|filename| Song.new_by_filename(filename)}
    end
end