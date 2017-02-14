json.extract! userstat, :id, :user_id, :difficulty_id, :clear, :created_at, :updated_at
json.url userstat_url(userstat, format: :json)