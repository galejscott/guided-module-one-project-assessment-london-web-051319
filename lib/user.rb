require 'pry'

class User < ActiveRecord::Base
    has_many :playlists
    has_many :entries, through: :playlists
    has_many :songs, through: :entries

    sarah = User.find_by(username: "sarah")
    walk_to_work = Playlist.find_by(name: "Walk to Work")
    hello = Song.find_by(title: "Hello")

    #Create
    def create_playlist(name, username)
       Playlist.create(name, self.username)
    end

    #Read
    def find_playlist_by_username(username)
        user = self.find_by(username: username)
        user.playlists
    end

    def find_playlist(playlist)
        Playlist.find_by(name: playlist)
binding.pry
    end


    #Update
    def self.add_song_to_playlist(playlist, title)
        found_song = Song.find_by(title: title)
        found_playlist = Playlist.find_by(name: playlist)
        new_entry = Entry.create(playlist_id: found_playlist.id, song_id: found_song.id)
        found_playlist << new_entry
    end

    #Delete
    def self.remove_song_from_playlist(playlist, title)
        found_playlist = Playlist.find_by(name: playlist)
        found_song = Song.find_by(title: title)
        found_playlist.delete_if {|song| song.id == found_song.id}
    end
    

    def length_playlist
        playlist.each {|song| song.length}.inject(:+)
    end


end