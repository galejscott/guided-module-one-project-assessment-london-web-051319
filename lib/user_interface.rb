$prompt = TTY::Prompt.new

class UserInterface

    $cliuser = nil

    def welcome
        puts "Welcome to Playlist-me"
        
        option = $prompt.select("Login or Register", ["Login", "Register", "Exit"])
            if option == "Login"
                @login = $prompt.collect do
                    key(:username).ask("Username") do |u|
                    u.modify :down
                    #match username to database username
                    end
                end
                if User.exists?(username: @login[:username])
                    $cliuser = User.find_by(username: @login[:username])
                    puts "Success. Welcome"
                    main_menu
                elsif @login[:username] == nil
                    $prompt.error("Please enter a valid username")
                    welcome
                else 
                    $prompt.error("Please enter a valid username")
                    welcome
                end
            elsif option == "Register"
                @new_username = $prompt.collect do
                    key(:username).ask("Username") do |u|
                    u.modify :down
                    end
                    #create new username
                end
                if  User.exists?(username: @new_username[:username])
                    $prompt.error("Username already taken, please select another")
                    welcome
                elsif @new_username[:username] == nil
                    $prompt.error("Please enter a valid username")
                    welcome
                else
                    $cliuser = User.create(username: @new_username[:username])
                    main_menu
                end
            else option == "Exit"
                exit
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
        
        playlist_menu = $prompt.select("Playlist Menu", ["Add Song", "Remove Song", "Delete Playlist", "View Playlist", "Main Menu"])
            if playlist_menu == "Add Song"
                add_song
            elsif playlist_menu == "Remove Song"
                remove_song
            elsif playlist_menu == "Delete Playlist"
                del_playlist
            elsif playlist_menu == "View Playlist"
                view_playlist
            else playlist_menu == "Main Menu"
                main_menu
            end
    end

    def create
        name = $prompt.collect do 
            key(:name).ask("Please enter a Playlist name")
            #create playlist, move to add song
            end 
            plist_name = name[:name]
            Playlist.create(name: plist_name, user_id: $cliuser.id)
            $plist = Playlist.find_by(name: plist_name)
        
        add_song
    end

    def add_song
        $prompt.say("Lets add a song")
        artist_list = (Artist.all.map {|a| a.name})
        
        artist = $prompt.select("Please select an Artist",[artist_list, "Playlist Menu"])
            if artist == "Playlist Menu"
                playlist_menu
            else
                selected_artist = Artist.find_by(name: artist)
            end
        song_list = selected_artist.songs.map {|a| a.title}
        song = $prompt.select("Please select a Song", [song_list, "Playlist Menu"])
            if song == "Playlist Menu"
                playlist_menu
            else 
                @@selected_song = Song.find_by(title: song)
            add = $prompt.select("add #{@@selected_song.title} to #{$plist.name}?", ["Yes", "No"]) 
            
                if add == "Yes"
                    Entry.create(playlist_id: $plist.id, song_id: @@selected_song.id)
                    $prompt.say("Success. Let's add another")
                    add_song 
                else add == "No"
                    playlist_menu
                end
            end
        
    end

    def remove_song
        playlist_songs = ($plist.songs.map{|s| s.title}) #list of entries within playlist
        song = $prompt.select("Select a Song", [playlist_songs, "Playlist Menu"])
            if song == "Playlist Menu"
                playlist_menu
            else 
                @@remove_song = Song.find_by(title: song)
            remove = $prompt.select("remove #{@@remove_song.title} from #{$plist.name}?", ["Yes", "No"]) 
                if remove == "Yes"
                    Entry.find_by(playlist_id: $plist.id, song_id: @@remove_song.id).destroy
                    $plist = Playlist.find_by(name: $plist.name)
                    $prompt.say("Done.")
                    playlist_menu 
                else remove == "No"
                    playlist_menu
                end
            end
        
    end

    def del_playlist
        your_plists = ($cliuser.playlists.map {|p| p.name})
        playlist = $prompt.select("Select your playlist", [your_plists, "Playlist Menu"])
            if playlist == "Playlist Menu"
                playlist_menu
            else 
                $plist = Playlist.find_by(name: playlist)
            delete = $prompt.select("Delete #{$plist.name}?", ["Yes", "No"]) 
                if delete == "Yes"
                    Entry.all.where(playlist_id: $plist.id).destroy_all
                    Playlist.all.where(id: $plist.id).destroy_all
                    Entry.all.reload
                    Playlist.all.reload
                    $prompt.say("Done.")
                    main_menu 
                else delete == "No"
                    playlist_menu
                end
            end
    end

    def select_existing_playlist
        your_plists = ($cliuser.playlists.map {|p| p.name})#list of your playlists
        playlist = $prompt.select("Select your playlist", [your_plists, "Main Menu"])
            if playlist == "Main Menu"
                main_menu
            else 
                $plist = Playlist.find_by(name: playlist)
                playlist_menu
            end
    end

    def other_playlists
        other = Playlist.all.select {|p| p.user_id != $cliuser.id}
        other_playlists = other.map {|p| p.name} #other playlists
        other_playlist = $prompt.select("Select a playlist", [other_playlists, "Main Menu"])
        
            if other_playlist == "Main Menu"
                main_menu
            else 
                $plist = Playlist.find_by(name: other_playlist)
                view_playlist
            end
    end

    def view_playlist
        playlist = $plist.songs
        show = playlist.map{|s| s.title}
        puts show
        back = $prompt.select("Main Menu", ["Main Menu"])
        if back == "Main Menu"
        main_menu
        end
    end
end
