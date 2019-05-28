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


end