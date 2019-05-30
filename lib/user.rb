class User < ActiveRecord::Base
    has_many :playlists
    has_many :entries, through: :playlists
    has_many :songs, through: :entries

    # sarah = User.find_by(username: "sarah")
    # walk_to_work = Playlist.find_by(name: "Walk to Work")
    # hello = Song.find_by(title: "Hello")

    #Create
    def create_playlist(name:)
       Playlist.create(name: name, user_id: self.id)
    end

    #Read
    def find_playlist(name:)
        Playlist.select(name: name)
    end

    def user_playlists
        self.playlists.select {|p| p.name}
    end

    def selected_playlist
        own_playlists.select {|p| p.name == $plist.name}
    end

    def own_playlists
        user_playlists.map {|p| p.name}
    end

    def other_playlists
        Playlist.all.select {|p| p.user_id != self.id}
    end



    #Update
    def add_song_to_playlist(song)        
        Entry.create(playlist_id: $plist.id, song_id: song.id)
    end

    #Delete
    def remove_song_from_playlist(song)
        Entry.find_by(playlist_id: $plist_name.id, song_id: song.id).destroy
    end

    def delete_playlist
        Entry.all.where(playlist_id: $plist_name.id).destroy_all
        Playlist.all.where(id: $plist_name.id).destroy_all
    end
    
   

    

end