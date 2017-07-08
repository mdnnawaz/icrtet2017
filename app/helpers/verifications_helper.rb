module VerificationsHelper

	def mobile_verification_button
		return '' unless current_user.needs_mobile_number_verifying?
		if current_user.verification_code.nil?
			html = <<-HTML
			<h3>Verify Your Mobile Number</h3>
			#{form_tag(verifications_path, method: "post")}
			#{button_tag('Verify', type: "submit", class: "btn btn-success")}
		</form>
		HTML
		html.html_safe
	else
		html = <<-HTML
		
		#{form_tag(verifications_path, method: "post")}
		#{button_tag('Resend OTP', type: "submit", class: "btn btn-primary")}
	</form>
	HTML
	html.html_safe
end

end

def verify_mobile_number_form
	return '' if current_user.verification_code.nil?
	current_user.verification_code.empty?
	html = <<-HTML
	<h3>Enter Verification Code</h3>
	#{form_tag(verifications_path, method: "put")}
	#{text_field_tag('verification_code')}
	#{button_tag('Submit', type: "submit", class: "btn btn-success")}
</form>
HTML
html.html_safe
end

end
