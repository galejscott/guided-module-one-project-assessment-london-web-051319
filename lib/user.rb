require 'pry'

class User < ActiveRecord::Base
    has_many :playlists
    has_many :entries, through: :playlists
    has_many :songs, through: :entries

    sarah = User.find_by(username: "sarah")
    walk_to_work = Playlist.find_by(name: "Walk to Work")
    hello = Song.find_by(title: "Hello")

    #Create
    def create_playlist(name: name)
       Playlist.create(name: name, user_id: self.id)
    end

    #Read
    def find_playlist(name: name)
        Playlist.select(name: name)
    end

    def own_playlists
        self.playlists.map {|p| p.name}
    end

    def other_playlists
        Playlist.all.select {|p| p.user_id != self.id}
    end


    def select_own_playlist(name: name)
        self.playlists.find_by(name: name)
    end



    #Update
    def add_song_to_playlist(name, song)
        # found_song = Song.find_by(title: song)
        # found_playlist = Playlist.find_by(name: playlist)
        # new_entry = Entry.create(playlist_id: found_playlist.id, song_id: found_song.id)
        playlist = select_own_playlist(name: name)
        Entry.create(playlist_id: playlist.id, song_id: song.id)
    end

    #Delete
    def remove_song_from_playlist(name, song)
        playlist = select_own_playlist(name: name)
        found_entry = Entry.find_by(playlist_id: playlist.id, song_id: song.id)
        found_entry.destroy
    end

    def delete_playlist(name: name)
        playlist = select_own_playlist(name: name)
        Entry.where(playlist_id: playlist.id).destroy_all
        Playlist.where(id: playlist.id).destroy_all
    end
    

    


end