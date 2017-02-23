# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

#song_text = File.read(Rails.root.join('lib', 'seeds', 'sdvx_songs.csv'))
#songs = CSV.parse(song_text, :headers => true, :encoding => 'UTF-8')
#songs.each do |row|
#	s = Song.find_or_initialize_by(id: row['id'])
#	s.song_name = row['song_name']
#	s.artist = row['artist']
#	s.save
#	puts "#{s.song_name} with id #{s.id} saved"
#end
#puts "There are #{Song.count} songs in the database"

diff_text = File.read(Rails.root.join('lib', 'seeds', 'sdvx_diffs.csv'))
diffs = CSV.parse(diff_text, :headers => true, :encoding => 'UTF-8')
diffs.each do |row|
	d = Difficulty.find_or_initialize_by(id: row['id'])
	d.song_id = row['song_id']
	#temp = Song.find(d.song_id).song_name
	#if row['song_name'] != temp
	#	raise "Song name does not match for #{d.id}"
	#end
	d.difficulty_name = row['diff_name']
	d.song_name = row['song_name']
	d.level = row['level']
	d.tier = row['tier']
	d.photo = row['photo']
	d.save
	puts "Song #{d.song_name} - #{d.difficulty_name.upcase} #{d.level} has been saved"
end
puts "\nThere are #{Difficulty.count} difficulties"