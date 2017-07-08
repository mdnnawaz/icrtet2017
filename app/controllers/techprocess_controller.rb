class TechprocessController < ApplicationController
	before_action :authorize_user
	before_action :authenticate_user!

	require 'rest-client'

	def payment


		@payment_details=PaymentDetail.all
		@current=@payment_details.find_by_user_id(current_user.id)
		@journaldetails = Journalpayment.all
		@currjournal = @journaldetails.find_by_user_id(current_user.id)

# event registration payment block
		# res=request.original_url
		# if res.include? "msg"

		# 	params.each do |k,v|
		# 		if params[:msg].include? "Transaction Failed"
		# 			@current.update_attributes(:isPaid => "false")
		# 			Rails.logger.info("payment failed")
		# 			redirect_to payment_details_path, :flash => {:warning => "Transaction failed"}
		# 			return
		# 		elsif params[:msg].include? "0300"
		# 			@current.update_attributes(:isPaid => "true")
		# 			Rails.logger.info("Payment Successfull")
		# 			redirect_to payment_details_path, :flash => {:success => "Transaction Successfull"}
		# 			return
		# 		else
		# 			Rails.logger.info("payment failed")
		# 			redirect_to payment_details_path, :flash => {:warning => "Transaction failed"}
		# 			return
		# 		end
		# 		Rails.logger.info "Param #{k}: #{v}"
		# 	end
		# end

#event registration payment block end

# journal payment start

res=request.original_url
if res.include? "msg"

	params.each do |k,v|
		if params[:msg].include? "Transaction Failed"
			# a=params[:msg]
			# Rails.logger.info(a);
			@currjournal.update_attributes(:isPaid => "false")
			Rails.logger.info("payment failed")
			redirect_to journalpayments_path, :flash => {:warning => "Transaction failed"}
			return
		elsif params[:msg].include? "0300"
			@currjournal.update_attributes(:isPaid => "true")
			Rails.logger.info("Payment Successfull")
			redirect_to journalpayments_path, :flash => {:success => "Transaction Successfull"}
			return
		else
			Rails.logger.info("payment failed")
			redirect_to journalpayments_path, :flash => {:warning => "Transaction failed"}
			return
		end
		Rails.logger.info "Param #{k}: #{v}"
	end
end

# journal payment block end


		# if @current.isPaid ==true 
		# 	redirect_to payment_details_path
		# end



		# 	resurl = URI::parse(res)
		# 	id=resurl.path.split('/')[4]
		# 	res_params = CGI::parse(resurl.query)

		# 	if res.include? "SUCCESS"
		# 		@current.update_attributes(:isPaid => "true")
		# 		@current.save
		# 		redirect_to payment_details_path, :flash => { :alert => "Transaction Successfull"}
		# 	elsif res.include? "Failed"
		# 		@current.update_attributes(:isPaid => "false")
		# 		@current.save
		# 		redirect_to techprocess_payment_path,  :flash => { :alert => "Transaction Failed"}
		# 	end
		# end
	end

	def pay
		@paydetail=PaymentDetail.all
		@cur = @paydetail.find_by_user_id(current_user.id)

		@journaldetails = Journalpayment.all
		@currjournal = @journaldetails.find_by_user_id(current_user.id)


		# event registration payment code starting

		# @ref =  1_000_000 + Random.rand(10_000_000 - 1_000_000) 
		# @cur.ref_id = "ICRTET17#{@ref}"
		# @cur.cust_id=current_user.first_name.delete(' ')
		# @cur.save
		# cust_id=@cur.cust_id
		# @refno=@cur.ref_id
		# amount=@cur.amount
		# returnurl = "http://icrtet2017.stjosephstechnology.ac.in/techprocess/payment"

		# clientreq = "https://portal.stjosephstechnology.ac.in/TechProcess?auth=fluffy&amount=#{amount}&user=ICRTET&custid=#{cust_id}&refno=#{@refno}&returnURL=#{returnurl}"
		# req = "https://portal.stjosephstechnology.ac.in/sendPost.jsp?RUrl=https://portal.stjosephstechnology.ac.in/TechProcess?auth=fluffy%26amount=#{amount}%26user=ICRTET%26custid=#{cust_id}%26refno=#{@refno}%26returnURL=#{returnurl}"
		# seturl = URI.encode(clientreq.strip)
		# @cur.payUrl = clientreq
		# @cur.save
		# 		# self.class.post(seturl)
		# 		@paper=Paper.all
		# 		@puser=@paper.find_by_user_id(current_user.id)
		# 		if !@puser.nil?
		# 			if @puser.rej==true 
		# 				redirect_to request.referrer,  :flash => { :warning => "Sorry your paper has been rejected."}
		# 			elsif @puser.rev==true && @puser.acc==false
		# 				redirect_to request.referrer,  :flash => { :warning => "Your paper is under review.Make payment once your paper is accepted."}
		# 			else 
		# 				redirect_to techprocess_apipost_path 
		# 			end
		# 		else
		# 			redirect_to papers_path, :flash => {:warning => "Upload the paper"}
		# 		end

				# event registration payment code ending

				# journal payment code starting #

				@ref =  1_000_000 + Random.rand(10_000_000 - 1_000_000) 
				@currjournal.ref_id = "ICRTET17J#{@ref}"
				@currjournal.name=current_user.first_name.delete(' ') 
				@currjournal.save
				cust_id=@currjournal.name
				@refno=@currjournal.ref_id
				amount=@currjournal.amount
				returnurl = "http://icrtet2017.stjosephstechnology.ac.in/techprocess/payment"

				clientreq = "https://portal.stjosephstechnology.ac.in/TechProcess?auth=fluffy&amount=#{amount}&user=ICRTET&custid=#{cust_id}&refno=#{@refno}&returnURL=#{returnurl}"
				req = "https://portal.stjosephstechnology.ac.in/sendPost.jsp?RUrl=https://portal.stjosephstechnology.ac.in/TechProcess?auth=fluffy%26amount=#{amount}%26user=ICRTET%26custid=#{cust_id}%26refno=#{@refno}%26returnURL=#{returnurl}"
				seturl = URI.encode(clientreq.strip)
				@currjournal.paylink = clientreq
				@currjournal.save
				
				redirect_to techprocess_apipost_path

				#journal payment code end #

			end





			def apipost
				@paydetail=PaymentDetail.all
				@cur = @paydetail.find_by_user_id(current_user.id)

				@journaldetails = Journalpayment.all
				@currjournal = @journaldetails.find_by_user_id(current_user.id)

			end
		end
