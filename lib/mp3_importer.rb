require 'pry'
class MP3Importer
attr_accessor :path, :files
@@files = []
def initialize(path)
@path = path
@directory = Dir.entries(@path)
@directory.each do |file|
  @@files << file if file.include?("mp3") && !@@files.include?(file)
end
end

def files
@@files
end

def import
  @@files.each do |file|
    Song.new_by_filename
  end
end

end
