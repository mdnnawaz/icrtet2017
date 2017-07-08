class PaymentDetailsController < ApplicationController
  before_action :set_payment_detail, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user
  before_action :authenticate_user!

  respond_to :html
  require 'rqrcode'
  # require 'rqrcode_png'





  def index
    @journal = Journal.new
    @journals = Journal.all
    @payment_details = PaymentDetail.all
    @payuser = @payment_details.find_by_user_id(current_user.id)

    if current_user.email != "admin@ncrtet2015.com"
      if @payment_details.find_by_user_id(current_user.id)

      # else
      #   redirect_to new_payment_detail_path
      end
    else
      respond_to do |format|
        format.html
        format.xlsx
      end
    end
  end


  def show
    respond_with(@payment_detail)
  end

  def new
    @journal = Journal.new
    @journals = Journal.all
    # @txn_id = "TX00#{rand(1..10000)}"
    # @Date = (Date.today).strftime("%d-%m-%Y")
    # @strNo = rand(1..1000000)
    # @returnUrl = "#{request.original_url}"
    @payment_detail = PaymentDetail.new
    respond_with(@payment_detail)
  end

  def pdf

    @payment_details = PaymentDetail.all
    @payuser = @payment_details.find_by_user_id(current_user.id)
    @uname = current_user.first_name + current_user.last_name
    @refid = @payuser.ref_id
    @am    = @payuser.amount
    @type = current_user.designation
    @paper = Paper.all
    @upaper = @paper.find_by_user_id(current_user.id)
    # @upaper.each do |p|
      if(@upaper.new_paper_version1_file_name != nil)
        if(@upaper.acc == true)   
          @ptitle = "RTET#{@upaper.type_of_conference[0,2].strip}%03d-%03d" %[@upaper.user_id,@upaper.id]
        end
      else
        if(@upaper.acc == true)
          "RTET#{@upaper.type_of_conference[0,2].strip}%03d-%03d" %[@upaper.user_id,@upaper.id]
        end
      end
    # end
    @qr = RQRCode::QRCode.new( "REF ID: #{@refid}", :size => 3, :level => :h )

    html = render_to_string(:action => :pdf,:template => "payment_details/pdf.html.erb")
    pdf = WickedPdf.new.pdf_from_string(html)
    save_path = Rails.root.join('public',"ICRTET%03dticket.pdf" %[current_user.id])
    File.open(save_path, 'wb') do |file|
      file << pdf
    end

    send_file(
      "#{Rails.root}/public/ICRTET%03dticket.pdf" %[current_user.id],
      # disposition: "inline",
      filename: "ICRTET%03dticket.pdf" %[current_user.id],
      type: "application/pdf"
      )
  end

  def edit
  end

  def create
    # @ref = rand(1..10000000)
    # @returnurl = "#{request.original_url}"
    # @payment_detail.ref_id = "REFID0#{@ref}"
    # @payment_detail.cust_id=current_user.first_name
    # cust_id=@payment_detail.cust_id
    @payment_detail = PaymentDetail.new(payment_detail_params)
    @payment_detail.user_id = current_user.id
    @amounts = payment_detail_params[:staff]
    @amount = payment_detail_params[:students]
    @am = payment_detail_params[:cert]
    puts @amounts

    @payment_detail.amount = @amounts.to_i * 1500 + @amount.to_i  * 1000 + @am.to_i * 250
    
    @payment_detail.save

    # @payment_detail.save
    if @payment_detail.save
      # if @payment.paid
      @payment_detail.user_number = "RTET17#{@payment_detail.id}"
      @payment_detail.save
      # end
    else
      # flash[:notice] = "Post successfully created"
    end
    redirect_to root_path, :flash => {:warning => "Payment has ended."}

    
    # render :layout => false
    # html = render_to_string(:action => :pdf,:layout => false)
    # pdf = WickedPdf.new.pdf_from_string(html)
    # save_path = Rails.root.join('public',"ticket#{current_user.id}.pdf")
    # File.open(save_path, 'wb') do |file|
    #   file << pdf
    # end


    # amount=@payment_detail.amount
    # clientreq = "https://portal.stjosephstechnology.ac.in/TechProcess?auth=fluffy&amount=#{amount}&user=SJIT&custid=#{cust_id}&refno=&returnURL=http://localhost:3000/payment_detail/new"
    # seturl = URI.encode(clientreq.strip)
    # response=HTTParty.post(clientreq)

    # puts response.body

  end


  def update
    @payment_detail.update(payment_detail_params)
    respond_with(@payment_detail)
  end

  def destroy
    @payment_detail.destroy
    respond_with(@payment_detail)
  end

#   def pdf

#   #  respond_to do |format|
#   #     format.html
#   #     format.pdf do
#   #       render pdf: "file_name"   # Excluding ".pdf" extension.
#   #     end
#   #   end
#   render :layout => false
# end


private
def set_payment_detail
  @payment_detail = PaymentDetail.find(params[:id])
end

def payment_detail_params
  params.require(:payment_detail).permit(:amount, :dd_number, :bank, :branch,:dd_copy, :accept, :staff, :students, :cert, :journal)
end


end
