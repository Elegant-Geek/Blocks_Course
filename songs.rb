require_relative "my_enumerable"

class Song
  attr_reader :name, :artist, :duration

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
  end

  def play
    puts "Playing '#{name}' by #{artist} (#{duration} mins)..."
  end
end

class Playlist
  # include Enumerable
  include MyEnumerable
    def initialize(name)
      @name = name
      @songs = []
    end
  
    def add_song(song)
      @songs << song
    end
# adding an each method to the Playlist
    def each
        @songs.each do |song| 
          # puts "Yielding #{song.name}..."
          yield song 
        end
    end

    def play_songs 
      each { |song| song.play }
    end

    def each_tagline
      # each { |song| puts "#{song.name} - #{song.artist}"}
      @songs.each { |song| yield "#{song.name} - #{song.artist}" }
    end

    def each_by_artist(artist_name) 
      select{ |song| song.artist == artist_name }.each { |song| yield song }
    end

  end


song1 = Song.new("Okie From Muskogee", "Merle", 5)
song2 = Song.new("Ramblin' Man", "Hank", 7)
song3 = Song.new("Good Hearted Woman", "Waylon", 6)
song1.play

pink_floyd_playlist = Playlist.new("Pink Floyd")

pink_floyd_playlist.add_song(song1)
pink_floyd_playlist.add_song(song2)
pink_floyd_playlist.add_song(song3)

puts "\nExample of calling the each method we defined:"
pink_floyd_playlist.each { |song| puts song.name }
# ^^^ this calls the name of EACH song we added to the playlist.


puts "\nThe play_songs method calls on the method in the Playlist class and outputs:"
pink_floyd_playlist.play_songs

hank_songs = pink_floyd_playlist.my_select { |song| song.artist =~ /Hank/ }
p hank_songs 

okie_songs = pink_floyd_playlist.my_select { |song| song.name =~ /Okie/ }
p okie_songs

non_okie_songs = pink_floyd_playlist.my_reject { |song| song.name =~ /Okie/ }
puts "Full non okie songs array:"
p non_okie_songs
non_okie_songs_titles = non_okie_songs.map{ |song| "#{song.name}" }
puts "Just the non okie songs tites:"
p non_okie_songs_titles

song_labels = pink_floyd_playlist.my_map { |song| "#{song.name} - #{song.artist}" }
p song_labels # shows array of formatted song labels (of all songs added to playlist). 

# pink_floyd_playlist.each_tagline { |tagline| puts tagline }


# pink_floyd_playlist.each_by_artist("Hank") { |song| song.play }



