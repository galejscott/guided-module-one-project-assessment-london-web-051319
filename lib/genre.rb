class Genre < ActiveRecord::Base
    has_many :songs
    has_many :artists, through: :songs

    def song_count
    #the number of songs in a genre
        self.songs.count
    end

    def artist_count
    #the number of artists from the genre
        self.artists.size
    end

    def all_artist_names
    #array of all artists's names
        self.artists.map {|artist| artist.name}
    end
end