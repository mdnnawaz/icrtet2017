class VerificationsController < ApplicationController
  before_action :set_verification, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /verifications
  # GET /verifications.json
  def index
    @verifications = Verification.all
  end

  # GET /verifications/1
  # GET /verifications/1.json
  def show
  end

  # GET /verifications/new
  def new
    @verification = Verification.new
  end

  # GET /verifications/1/edit
  def edit
  end

  # POST /verifications
  # POST /verifications.json
  def create



    current_user.verification_code =  1_000_000 + rand(10_000_000 - 1_000_000)
    current_user.save

    to = current_user.mobile_number
    # to="0"+to
    # if to[0] = "0"
    #   to.sub!("0", '+91')
    # end

    url = "https://portal.stjosephstechnology.ac.in/JsonSMS?number=#{to}&message=ICRTET 2017: your one time password is #{current_user.verification_code}&auth=fluffy&senderid=ICRTET"
    seturl = URI.encode(url.strip)
    response = HTTParty.get(seturl)
    @user=current_user
    StatusMailer.verify(@user).deliver_now
    if response.body.include? "Sent"
      redirect_to new_verification_path, :flash => { :success => "A verification code has been sent to your mobile and e-mail. Please fill it in below." }

    else
      # redirect_to request.referrer, :flash => { :notice => "OTP not sent retry again"}
      redirect_to :back,  :flash => { :alert => "OTP not sent retry again"}
    end
  end

  def verify
    if current_user.verification_code == params[:verification_code]
      current_user.is_verified = true
      current_user.verification_code = ''
      current_user.save
      to = current_user.mobile_number
      @user = current_user
      url = "https://portal.stjosephstechnology.ac.in/JsonSMS?number=#{to}&message=Dear #{@user.first_name}, you have been successfully registered for ICRTET 2017. Kindly upload your paper through our website. ICRTET 2017 Team.&auth=fluffy&senderid=ICRTET"
      seturl = URI.encode(url.strip)
      response = HTTParty.get(seturl)
      StatusMailer.welcome(@user).deliver_now
      redirect_to home_path, :flash => { :success => "Thank you for verifying your mobile number." }
      return
    else
      redirect_to new_verification_path, :flash => { :errors => "Invalid verification code." }
      return
    end
  end

  # PATCH/PUT /verifications/1
  # PATCH/PUT /verifications/1.json
  def update
    respond_to do |format|
      if @verification.update(verification_params)
        format.html { redirect_to @verification, notice: 'Verification was successfully updated.' }
        format.json { render :show, status: :ok, location: @verification }
      else
        format.html { render :edit }
        format.json { render json: @verification.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /verifications/1
  # DELETE /verifications/1.json
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_verification
      @verification = Verification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def verification_params
      params.fetch(:verification, {})
    end
  end
