$prompt = TTY::Prompt.new


    def welcome
        puts "Welcome to Playlist-me"
        
        option = $prompt.select("Login or Register new user", ["Login", "Register new user"])
            if option == "Login"
                login = $prompt.collect do
                    key(:username).ask("Username")
                    #match username to database username
                    main_menu
                end
            else option == "Register new user"
                username = $prompt.collect do
                    key(:username).ask("Username")
                    #create new username
                    User.create(username: username)
                    main_menu
                end
            end
        
    end

    def main_menu
        option = $prompt.select("Main Menu", ["Create Playlist", "Select Existing Playlist", "Select Another Users Playlist", "Log out"])
            if option == "Create Playlist"
                create
            elsif option == "Select Existing Playlist"
                select_existing_playlist
            elsif option == "Select Another Users Playlist"
                other_playlists
            else option == "Log out"
                welcome
            end
    end

    def playlist_menu
        playlist_menu = $prompt.select("Playlist Menu", ["Add Song", "Remove Song", "Delete Playlist", "Main Menu"])
            if playlist_menu == "Add Song"
                add_song
            elsif playlist_menu == "Remove Song"
                remove_song
            elsif playlist_menu == "Delete Playlist"
                delete_playlist
            else playlist_menu == "Main Menu"
                main_menu
            end
    end

    def create
        name = $prompt.collect do 
            key(:name).ask("Please enter a Playlist name")
            #create playlist, move to add song
            end 
            user.Playlist.create(name: name, user_id: user.id)
        add_song
    end

    def add_song
        $prompt.say("Lets add a song")
        artist_list = (Artist.all.map {|a| a.name})
        artist = $prompt.select("Please select an Artist",[artist_list, "Playlist Menu"])
            if artist == "Playlist Menu"
                playlist_menu
            else artist == artist_list
                #select artist
            end
        song_list = () #song list by artist selected
        song = $prompt.select("Please select a Song", [song_list, "Playlist Menu"])
            if song == "Playlist Menu"
                playlist_menu
            else song == "#song"
                #select song
            end
        add = $prompt.yes?("add song?") do |q|
            q.suffix "Yes/No"
            if add == "Yes"
                #add song
                $prompt.say("Success. Let's add another")
                add_song 
            else add == "No"
                add_song
            end
        end
    end

    def remove_song
        playlist_songs = () #list of entries within playlist
        remove == $prompt.select("Select a Song", [playlist_songs, "Playlist Menu"])
            if remove == "Playlist Menu"
                playlist_menu
            else remove == "#song"
                #remove song from playlist
            end
    end

    def delete_playlist
        your_playlists = (username.playlists.map {|p| p.name}) #list of your playlists
        delete == $prompt.select("Select your playlist", [your_playlists, "Playlist Menu"])
            if delete == "Playlist Menu"
                playlist_menu
            else delete == "#playlist"
                #delete playlist
            end
    end

    def select_existing_playlist
        your_playlists = (username.playlists.map {|p| p.name}) #list of your playlists
        your_playlist == $prompt.select("Select your playlist", [your_playlists, "Main Menu"])
            if your_playlist == "Playlist Menu"
                main_menu
            else your_playlist == "#playlist"
                #playlist
            end
    end

    def other_playlists
        other_playlists = (username.Playlist.all.select {|p| p.user_id != self.id}) #other playlists
        other_playlist == $prompt.select("Select a playlist", [other_playlists, "Main Menu"])
            if other_playlist == "Playlist Menu"
                main_menu
            else other_playlist == "#playlist"
                #view playlist
            end
    end



    