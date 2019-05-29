$prompt = TTY::Prompt.new
class UserInterface

    def welcome
        puts "Welcome to Playlist-me"
        
        option = $prompt.select("Login or Register new user", ["Login", "Register new user"])
            if option == "Login"
                login = $prompt.collect do
                    key(:username).ask("Username")
                end
            else option == "Register new user"
                username = $prompt.collect do
                    key(:username).ask("Username")
                end
            end
        end
    end

    def main_menu
        option = $prompt.select("Main Menu", ["Create Playlist", "Select Existing Playlist", "Select Another Users Playlist", "Log out"])
            if option == "Create Playlist"
                #create playlist - enter name
            elsif option == "Select Existing Playlist"
                #show list of your own playlists
            elsif option == "Select Another Users Playlist"
                #show list of others playlists
            else option == "Log out"
                #back to welcome
            end
    end

    def create
        name = $prompt.collect do 
            key(:name).ask("Please enter a Playlist name")
            #create playlist
        end
    end

    def add_song
        #select an artist
        #select a song
        #add? yes or no - no - back to select artist
    end

    def remove_song
        #remove song from playlist
    end

    def delete_playlist
        #delete playlist - back to mainmenu
    end

    def select_existing_playlist
        #show list previously made playlists
        #add songs
        #remove songs
        #delete playlist
    end

    def other_playlists
        #show list of other users playlists
    end

end

    