require 'pry'

class User < ActiveRecord::Base
    has_many :playlists
    has_many :entries, through: :playlists
    has_many :songs, through: :entries

    sarah = User.find_by(username: "sarah")
    walk_to_work = Playlist.find_by(name: "Walk to Work")
    hello = Song.find_by(title: "Hello")

    #Create
    def create_playlist(name, user_id)
       Playlist.create(name: name, user_id: self.id)
    end

    #Read
    def find_playlist(name: name)
        Playlist.select(name: name)
    end

    def own_playlists
        self.playlists.map {|p| p.name}
    end

    


    def select_own_playlist(playlist_name)
        self.playlists.find {|p| p.name == playlist_name}
    end



    #Update
    def add_song_to_playlist(playlist_name, song)
        # found_song = Song.find_by(title: song)
        # found_playlist = Playlist.find_by(name: playlist)
        # new_entry = Entry.create(playlist_id: found_playlist.id, song_id: found_song.id)
        playlist = select_own_playlist(playlist_name)
        Entry.create(playlist_id: playlist.id, song_id: song.id)
    end

    #Delete
    def remove_song_from_playlist(playlist_name, song)
        playlist = select_own_playlist(playlist_name)
        found_entry = Entry.find_by(playlist_id: playlist.id, song_id: song.id)
        found_entry.destroy
    end

    
    

    def length_playlist
        playlist.each {|song| song.length}.inject(:+)
    end


end