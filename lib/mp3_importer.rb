class MP3Importer 
    attr_accessor :path

    def initialize(path)
        @path = path
    end 

    def files 
        Dir.glob("#{@path}/*.mp3").map do |file| 
        file.split("/")[-1]
        end 
    end 

    def import
        files.each do |file| 
            Song.new_by_filename(file)
        end 

    end 
end 

=begin

  def files 
        list = []
        Dir.glob("#{@path}/*.mp3").each do |file| 
        formatted = file.split("/")
        list.push(formatted[-1])
        end 
        list
    end 

=end 