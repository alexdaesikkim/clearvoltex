# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Song.create({:id => 1, :song_name => "Ultimate Ascension", :artist => "Camellia", :bpm => "200", :effect => "Don't Know"})
Song.create({:id => 2, :song_name => "Apex of the World", :artist => "Camellia", :bpm => "200", :effect => "Don't Know"})
Song.create({:id => 3, :song_name => "#Endroll", :artist => "Camellia", :bpm => "200", :effect => "Don't Know"})
Song.create({:id => 4, :song_name => "IKAROS DYNAMITE!!!!", :artist => "Camellia", :bpm => "200", :effect => "Don't Know"})
Song.create({:id => 5, :song_name => "XyHATTE", :artist => "Camellia", :bpm => "200", :effect => "Don't Know"})
Song.create({:id => 6, :song_name => "到達してしまった僕らと 夢と希望の最之果", :artist => "Camellia", :bpm => "200", :effect => "Don't Know"})
Song.create({:id => 7, :song_name => "Ganymede kamome mix", :artist => "Camellia", :bpm => "200", :effect => "Don't Know"})
Song.create({:id => 8, :song_name => "Poppin Shower", :artist => "Camellia", :bpm => "200", :effect => "Don't Know"})
Song.create({:id => 9, :song_name => "Booths of Fighters", :artist => "Camellia", :bpm => "200", :effect => "Don't Know"})
Song.create({:id => 10, :song_name => "Backflow", :artist => "Camellia", :bpm => "200", :effect => "Don't Know"})

Difficulty.create({:id => 1, :song_id => 1, :difficulty_name => "exh", :level => 18, :photo => "test_1.jpg"})
Difficulty.create({:id => 2, :song_id => 2, :difficulty_name => "exh", :level => 17, :photo => "test_2.jpg"})
Difficulty.create({:id => 3, :song_id => 3, :difficulty_name => "exh", :level => 18, :photo => "test_3.jpg"})
Difficulty.create({:id => 4, :song_id => 4, :difficulty_name => "exh", :level => 18, :photo => "test_4.jpg"})
Difficulty.create({:id => 5, :song_id => 5, :difficulty_name => "exh", :level => 18, :photo => "test_5.jpg"})
Difficulty.create({:id => 6, :song_id => 6, :difficulty_name => "exh", :level => 18, :photo => "test_6.jpg"})
Difficulty.create({:id => 7, :song_id => 7, :difficulty_name => "inf", :level => 17, :photo => "test_7.jpg"})
Difficulty.create({:id => 8, :song_id => 8, :difficulty_name => "mxm", :level => 16, :photo => "test_8.jpg"})
Difficulty.create({:id => 9, :song_id => 9, :difficulty_name => "exh", :level => 17, :photo => "test_9.jpg"})
Difficulty.create({:id => 10, :song_id => 10, :difficulty_name => "exh", :level => 17, :photo => "test_10.jpg"})