json.extract! user, :id, :username, :password_digest, :display_name, :email, :role, :created_at, :updated_at
json.url user_url(user, format: :json)