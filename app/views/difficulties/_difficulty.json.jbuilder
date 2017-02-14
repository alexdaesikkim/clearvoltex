json.extract! difficulty, :id, :song_id, :difficulty_name, :level, :photo, :created_at, :updated_at
json.url difficulty_url(difficulty, format: :json)