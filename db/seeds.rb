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
puts "Saving difficulties"
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
end

puts "\nThere are #{Difficulty.count} difficulties"

dan_text = File.read(Rails.root.join('lib', 'seeds', 'dan_courses.csv'))
dans = CSV.parse(dan_text, :headers => true, :encoding => 'UTF-8')
dans.each do |row|
	d = Dan.find_or_initialize_by(id: row['id'])
	d.name = row['name']
	d.level = row['level']
	d.first_song_id = row['song_id_1']
	d.second_song_id = row['song_id_2']
	d.third_song_id = row['song_id_3']
	d.photo = row['photo']
	date = row['date']
	d.release_date = Date.strptime(date, '%m/%d/%Y')
	first = Dandifficulty.find_or_initialize_by(difficulty_id: d.first_song_id, dan_id: d.id)
	second = Dandifficulty.find_or_initialize_by(difficulty_id: d.second_song_id, dan_id: d.id)
	third = Dandifficulty.find_or_initialize_by(difficulty_id: d.third_song_id, dan_id: d.id)
	first.save
	second.save
	third.save
	if row['active'] = 1
		d.active = true
	else
		d.active = false
	end
	d.save
end

puts "\nDans have been added, there are #{Dan.count} dans."