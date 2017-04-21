class ClearvoltexMailer < ApplicationMailer
	def account_activation(user)
		@user = user
		mail(:to => @user.email, subject: 'ClearVoltex Activation')
	end

	def manual_activation(user)
		@user = user
		mail(:to => @user.email, subject: 'Welcome to ClearVoltex!')
	end

	def password_reset(user)
		@user = user
		mail(:to => @user.email, subject: 'Password reset')
	end
end
