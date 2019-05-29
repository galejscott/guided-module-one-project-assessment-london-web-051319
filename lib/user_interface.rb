class UserInterface

    def get_user
        puts "Welcome to Playlist-me"

        puts "Enter a username"
        username = gets.chomp
    end

    def get_playlist
        puts "Enter a playlist name"
        Playlist.name = gets.chomp
    end

    def add_song
        puts "Lets add a song. Please pick an artist"
        #drop down menu?
        puts "Select a song"
        #if song selected add to playlist. if not restart process
    end

    def see_other_playlist
        
    end
end

    