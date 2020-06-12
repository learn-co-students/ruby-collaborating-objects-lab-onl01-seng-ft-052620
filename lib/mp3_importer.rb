class MP3Importer 
  attr_accessor :path
  
  def initialize(path)
    @path = path
  end
  
  def files
    file_array = Dir.children("spec/fixtures/mp3s")
  end 
  
  def import
    filenames = self.files 
    filenames.each do |filename| 
      Song.new_by_filename(filename)
    end
  end
end