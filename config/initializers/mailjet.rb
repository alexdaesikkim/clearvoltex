Mailjet.configure do |config|
  config.api_key = Rails.application.secrets.MAILER_API_KEY
  config.secret_key =  Rails.application.secrets.MAILER_SECRET_KEY
end