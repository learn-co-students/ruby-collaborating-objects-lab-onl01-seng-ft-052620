class MP3Importer
  attr_accessor :path, :files
  
  def initialize(path)
    
    @path = path
    @files = []
    Dir.foreach(@path) do |file|
      if file.include?("mp3") 
        @files << file
        
    end
  end  
 end 
 
 
 def import
   @files.each do |file|
     Song.new_by_filename(file)
     
  end   
end 
 
 
 
  
end  