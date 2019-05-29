class Playlist < ActiveRecord::Base
    belongs_to :user
    has_many :entries
    has_many :songs, through: :entries

    def find_playlist_by_username(username)
        Playlist.find_by(username: username)
    end

end