class Song
  attr_accessor :name, :artist_name, :filename
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
  	new_song = Song.new 
  	# initailizes a song
  	@@all << new_song
  	# saves it to the @@all class
  	new_song
  end

  def self.new_by_name(name)
  	new_song = Song.new
  	new_song.name = name
  	# saves with a name property
  	new_song
  	# return
  end

  def self.create_by_name(name)
  	new_song = self.new
  	new_song.name = name
  	@@all << new_song
  	new_song
  end

  def self.find_by_name(name)
  	@@all.each do |song|
  		if song.name == name
  			return song
  		end
  	end
  	nil
  end

  def self.find_or_create_by_name(name)
  	if find_by_name(name) == nil
  		create_by_name(name)
  	else 
  		find_by_name(name)
  	end
  end

  def self.alphabetical
  	@@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
  	new_song = Song.new
  	split_general = filename.split(" - ")
  	# "'Taylor Swift', 'Blank Space.mp3'"
  	new_song.artist_name = split_general[0]
  	# artist_name = "Taylor Swift"
  	split_more = filename.split(".mp3")
  	# "'Taylor Swift', 'Blank Space'"
  	split_again = split_more.join("").split("- ")
  	# isolates the song title

  	new_song.name = split_again[1]
  	new_song

  end

  def self.create_from_filename(filename)
  	new_song = Song.new_from_filename(filename)
  	new_song.save
  	new_song
  	# use save to save a song/artist_name based on the filename format
  end

  def self.destroy_all
  	self.all.clear
  end

end
