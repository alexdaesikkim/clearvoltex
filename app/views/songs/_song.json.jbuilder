json.extract! song, :id, :song_name, :artist, :bpm, :effect, :created_at, :updated_at
json.url song_url(song, format: :json)