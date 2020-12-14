require 'pry'
class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        @@all << self
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song_info = filename.chomp(".mp3").split(" - ")
        song = self.new(song_info[1])
        song.artist_name = song_info[0]
        song
    end


end
#binding.pry
