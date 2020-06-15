require 'pry'
class MP3Importer
  attr_accessor :path 
  
  def initialize(music_path)
    @path = music_path
  end
  
  def files
    Dir.entries(@path).select {|f| !File.directory? f}
  end 
  
  def import
    files.collect {|file| Song.new_by_filename(file) }
  end
end 