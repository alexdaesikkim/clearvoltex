# Preview all emails at http://localhost:3000/rails/mailers/clearvoltex_mailer
class ClearvoltexMailerPreview < ActionMailer::Preview
  def manual_activation_preview
  	ClearvoltexMailer.manual_activation(User.first)
  end
end
