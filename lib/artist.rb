class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    def song_count
        #number of songs associated with the artist
        self.songs.size
    end

    def genre_count
        #number of genres associated with the artist
        self.genres.size
    end

    def artist_list
        Artist.all.map {|a| a.name}
    end

    def artist_songs
        self.songs
    end

end
