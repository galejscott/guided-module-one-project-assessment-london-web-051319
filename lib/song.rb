class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :entries

  def get_artist_name
    self.artist.name
  end

  def get_genre_name
    self.genre.name
  end

  def song_length
    self.length
  end

  def playlist
    self.playlists
  end

  def find_song(title)
    Song.find_by(title: title)
  end

  def songs_by_artist(artist)
    Song.all.map {|s| s.artist}
  end
  

end