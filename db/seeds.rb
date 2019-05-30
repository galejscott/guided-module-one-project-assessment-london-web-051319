
#user
sarah = User.create(username: "sarah")
joe = User.create(username: "joe")
hoots = User.create(username: "hoots")

#playlist
massive_tunes = Playlist.create(name: "Massive Tunes", user_id: joe.id)
walk_to_work = Playlist.create(name: "Walk to Work", user_id: sarah.id)
gym = Playlist.create(name: "Gym", user_id: hoots.id)
beatles = Playlist.create(name: "I love John, Paul, George and Ringo", user_id: joe.id)

#artist
adele = Artist.create(name: "Adele")
the_beatles = Artist.create(name: "The Beatles")
acdc = Artist.create(name: "AC/DC")
elton_john = Artist.create(name: "Elton John")
fleetwood_mac = Artist.create(name: "Fleetwood Mac")
bruce_springsteen = Artist.create(name: "Bruce Springsteen")
david_bowie = Artist.create(name: "David Bowie")
dj_meh = Artist.create(name: "DJ Meh")
david_guetta = Artist.create(name: "David Guetta")

#genre
pop = Genre.create(name: "Pop")
rock = Genre.create(name: "Rock")
house = Genre.create(name: "House")
dance = Genre.create(name: "Dance")

#song
hello = Song.create(title: "Hello", artist_id: adele.id, genre_id: pop.id, length: 3.56)
hey_jude = Song.create(title: "Hey Jude", artist_id: the_beatles.id, genre_id: pop.id, length: 3.03)
yellow_submarine = Song.create(title: "Yellow Submarine", artist_id: the_beatles.id, genre_id: pop.id, length: 2.48)
back_in_black = Song.create(title: "Back in Black", artist_id: acdc.id, genre_id: rock.id, length: 4.29)
rocketman = Song.create(title: "Rocketman", artist_id: elton_john.id, genre_id: pop.id, length: 3.45)
the_chain = Song.create(title: "The Chain", artist_id: fleetwood_mac.id, genre_id: rock.id, length: 4.17)
born_in_the_usa = Song.create(title: "Born in the USA", artist_id: bruce_springsteen.id, genre_id: rock.id, length: 4.25)
heroes = Song.create(title: "Heroes", artist_id: david_bowie.id, genre_id: rock.id, length: 4.40)
house_mix = Song.create(title: "House mix", artist_id: dj_meh.id, genre_id: house.id, length: 17.17)
titanium = Song.create(title: "Titanium", artist_id: david_guetta.id, genre_id: dance.id, length: 4.12)

#entry
entry1 = Entry.create(playlist_id: beatles.id, song_id: hey_jude.id)
entry2 = Entry.create(playlist_id: beatles.id, song_id: yellow_submarine.id)
entry3 = Entry.create(playlist_id: gym.id, song_id: back_in_black.id)
entry4 = Entry.create(playlist_id: gym.id, song_id: the_chain.id)
entry5 = Entry.create(playlist_id: gym.id, song_id: house_mix.id)
entry6 = Entry.create(playlist_id: gym.id, song_id: titanium.id)
entry7 = Entry.create(playlist_id: walk_to_work.id, song_id: hello.id)
entry8 = Entry.create(playlist_id: walk_to_work.id, song_id: rocketman.id)
entry9 = Entry.create(playlist_id: walk_to_work.id, song_id: heroes.id)
entry10 = Entry.create(playlist_id: walk_to_work.id, song_id: born_in_the_usa.id)
entry11 = Entry.create(playlist_id: massive_tunes.id, song_id: rocketman.id)
entry12 = Entry.create(playlist_id: massive_tunes.id, song_id: heroes.id)
entry13 = Entry.create(playlist_id: massive_tunes.id, song_id: hello.id)
entry14 = Entry.create(playlist_id: massive_tunes.id, song_id: back_in_black.id)



