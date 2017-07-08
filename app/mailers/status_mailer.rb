class StatusMailer < ApplicationMailer

	default from: "icrtet2017@stjosephstechnology.ac.in"

# layout 'accept'

def welcome(user)
	@user = user
	mail(to: @user.email, subject: 'Welcome to ICRTET 2017')
end

def accept(user,paper)

	@user = user
	@paper=paper
	mail(to: @user.email, subject: 'ICRTET 2017:Your paper has been accepted')

end

def reject(user,paper)
	@user = user
	@paper=paper
	mail(to: @user.email, subject: 'ICRTET 2017: Your paper has been rejected')

end

def revision(user,paper)
	@user = user
	@paper=paper
	mail(to: @user.email, subject: 'ICRTET 2017 : Your paper needs revision')
end

def verify(user)
	@user=user
	# @verify=@user.verification_code
	mail(to: @user.email, subject: 'ICRTET 2017:OTP verification Code')
end
end
