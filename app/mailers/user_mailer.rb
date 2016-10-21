class UserMailer < ApplicationMailer
	default from: 'ss.nextacademy@gmail.com'

	def welcome_email(user)
		@user = user
		@url = 'http://localhost:3000/'
		mail(to: @user.email, subject: 'Welcome to my awesome site')
	end
end
