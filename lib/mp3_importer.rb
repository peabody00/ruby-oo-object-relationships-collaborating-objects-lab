require 'pry'
class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        mp3s = Dir.glob("#{@path}/*.mp3").collect{ |file| file.gsub("#{@path}/", "") }
    end
    
    def import
        files.each do |filename|
            Song.new_by_filename(filename)
        end
    end
    
    
end

#binding.pry