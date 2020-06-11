require 'pry'
class MP3Importer
    attr_accessor :path

    def initialize(file_path)
        @path = file_path
    end

    def files 
        file_list = Dir.entries(@path)
        file_list.select{|file| file.end_with?(".mp3")}
        # binding.pry
    end

    def import
        files.each do |mp3|
            Song.new_by_filename(mp3)
        end
    end
end