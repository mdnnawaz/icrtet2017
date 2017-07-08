class DashboardController < ApplicationController
	before_action :authenticate_user!
	before_action :authorize_admin
	def dash
		@user = User.all
		@paper=Paper.all
	end

	def accept
		
		@user = User.find(params[:uid])
		@paper=Paper.find(params[:id])
		@to = @user.mobile_number
		@paper.update_attributes(:acc => "true")
		if @paper.acc == true
			@paper.update_attributes(:rej => "false")
			@paper.update_attributes(:rev => "false")
		end
		@paper.save
		uname=@user.first_name
		purl=@paper.new_paper_version1_file_name
		url = "https://portal.stjosephstechnology.ac.in/JsonSMS?number=#{@to}&message=Dear #{uname}, your paper #{purl} has been accepted for the ICRTET 2017. Kindly pay the conference fee through our website Online Payment Facility and upload your camera ready paper to our website on or before 25th April 2017.&auth=fluffy&senderid=ICRTET"
		seturl = URI.encode(url.strip)
		response = HTTParty.get(seturl)
		StatusMailer.accept(@user,@paper).deliver_now
		redirect_to dashboard_dash_path,  :flash => { :success => "Updated"}

	end

	def reject
		@user = User.find(params[:uid])
		@paper=Paper.find(params[:id])
		@to = @user.mobile_number
		@paper.update_attributes(:rej => "true")
		if @paper.rej == true
			@paper.update_attributes(:acc => "false")
			@paper.update_attributes(:rev => "false")
		end
		uname=@user.first_name
		purl=@paper.new_paper_version1_file_name
		@paper.save
		url = "https://portal.stjosephstechnology.ac.in/JsonSMS?number=#{@to}&message=Dear #{uname}, we are sorry to inform you that your paper #{purl} has been rejected for ICRTET 2017.&auth=fluffy&senderid=ICRTET"
		seturl = URI.encode(url.strip)
		response = HTTParty.get(seturl)
		StatusMailer.reject(@user,@paper).deliver_now
		redirect_to dashboard_dash_path,  :flash => { :success => "Updated"}
	end


	def revision
		
		@user = User.find(params[:uid])
		@paper=Paper.find(params[:id])
		@to = @user.mobile_number
		@paper.update_attributes(:rev => "true")
		if @paper.rev == true
			@paper.update_attributes(:rej => "false")
			@paper.update_attributes(:acc => "false")
		end
		@paper.save
		uname=@user.first_name
		purl=@paper.new_paper_version1_file_name
		url = "https://portal.stjosephstechnology.ac.in/JsonSMS?number=#{@to}&message=Dear #{uname}, your paper #{purl} has been reviewed and it requires some revisions to be made. Kindly upload your revised paper soon.&auth=fluffy&senderid=ICRTET"
		seturl = URI.encode(url.strip)
		response = HTTParty.get(seturl)
		StatusMailer.revision(@user,@paper).deliver_now
		redirect_to dashboard_dash_path,  :flash => { :success => "Updated"}
	end


	def pdf

		@user = User.find(params[:uid])
		@paper=Paper.find(params[:pid])
		
		html = render_to_string(:action => :pdf,:template => "dashboard/pdf.html.erb")
		pdf = WickedPdf.new.pdf_from_string(html)
		save_path = Rails.root.join('public',"RTET#{@paper.type_of_conference[0,4].strip}%03d-%03d.pdf" %[@paper.user_id,@paper.id])
		File.open(save_path, 'wb') do |file|
			file << pdf
		end

		send_file(
			"#{Rails.root}/public/RTET#{@paper.type_of_conference[0,4].strip}%03d-%03d.pdf" %[@paper.user_id,@paper.id],
    # disposition: "inline",

    filename: "RTET#{@paper.type_of_conference[0,4].strip}%03d-%03d.pdf" %[@paper.user_id,@paper.id],
    type: "application/pdf"
    )
	end

	# def create
	# 	@paper=Paper.find(params[:id])
	# 	@paper.update_attributes(:status)
	# 	@paper.save
	# 	if @paper.status == "ACCEPTED"
	# 	# url = "https://portal.stjosephstechnology.ac.in/JsonSMS?number=#{to}&message=Your paper has been accepted&auth=fluffy&senderid=WELCOME"
	# 	# seturl = URI.encode(url.strip)
	# 	# response = HTTParty.get(seturl)
	# 	redirect_to dashboard_dash_path,  :flash => { :notice => "Updated"}
	# elsif @paper.status =="REVISION"
	# 	# url = "https://portal.stjosephstechnology.ac.in/JsonSMS?number=#{to}&message=Your paper is rejected&auth=fluffy&senderid=WELCOME"
	# 	# seturl = URI.encode(url.strip)
	# 	# response = HTTParty.get(seturl)
	# 	redirect_to dashboard_dash_path,  :flash => { :notice => "Updated"}
	# else 
	# 	# url = "https://portal.stjosephstechnology.ac.in/JsonSMS?number=#{to}&message=Accepted but revisions needed&auth=fluffy&senderid=WELCOME"
	# 	# seturl = URI.encode(url.strip)
	# 	# response = HTTParty.get(seturl)
	# 	redirect_to dashboard_dash_path,  :flash => { :notice => "Updated"}
	# end
	# end
	def paper_params
		params.require(:paper).permit(:status)
	end
end
