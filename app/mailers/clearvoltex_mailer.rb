class ClearvoltexMailer < ApplicationMailer
	def manual_activation(user)
		@user = user
		mail(:to => @user.email, subject: 'Welcome to ClearVoltex!')
	end
end
