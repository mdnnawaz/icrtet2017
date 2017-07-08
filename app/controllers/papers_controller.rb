class PapersController < ApplicationController
  before_action :set_paper, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authorize_user
  # GET /papers
  # GET /papers.json
  def index
    @papers = Paper.all
  end

  # GET /papers/1
  # GET /papers/1.json
  def show
  end

  # GET /papers/new
  def new
    @paper = Paper.new
  end

  # GET /papers/1/edit
  def edit
    @payment_details = PaymentDetail.all
    @payuser = @payment_details.find_by_user_id(current_user.id)
  end

  def cam
    respond_to do |format|
      if @paper.update(paper_params)
        format.html { redirect_to papers_path, notice: 'Paper was successfully updated.' }
        format.json { render :show, status: :ok, location: @paper }
      else
        format.html { render :edit }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /papers
  # POST /papers.json
  def create
    @paper = Paper.new(paper_params)
    # @paper.save
    @paper.user_id = current_user.id
    @paper.save
    to = current_user.mobile_number
    purl=@paper.new_paper_version1_file_name
    uname=current_user.first_name
    respond_to do |format|
      if @paper.save
        url = "https://portal.stjosephstechnology.ac.in/JsonSMS?number=#{to}&message=Dear #{uname}, your paper has been successfully uploaded for ICRTET 2017 and is being reviewed. Your paper ID is #{purl}. Use it for future references.&auth=fluffy&senderid=ICRTET"
        seturl = URI.encode(url.strip)
        response = HTTParty.get(seturl)
        format.html { redirect_to papers_path, notice: 'Paper was successfully created.' }
        format.json { render :show, status: :created, location: @paper }
      else
        format.html { render :new }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /papers/1
  # PATCH/PUT /papers/1.json
  def update
    respond_to do |format|
      if @paper.update(paper_params)
        format.html { redirect_to papers_path, notice: 'Paper was successfully updated.' }
        format.json { render :show, status: :ok, location: @paper }
      else
        format.html { render :edit }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /papers/1
  # DELETE /papers/1.json
  def destroy
    @paper.destroy
    respond_to do |format|
      format.html { redirect_to papers_url, notice: 'Paper was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paper
      @paper = Paper.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def paper_params
      params.require(:paper).permit(:paper_tile, :author1, :author2, :author3, :author4, :author5, :abstract, :type_of_conference, :paper_version1, :paper_version2, :camera_ready_paper)
    end
  end
