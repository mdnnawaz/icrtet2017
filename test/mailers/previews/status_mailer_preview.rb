# Preview all emails at http://localhost:3000/rails/mailers/status_mailer
class StatusMailerPreview < ActionMailer::Preview
	def sample_mail_preview
		ExampleMailer.accept(User.first)
	end
end
