class JournalpaymentsController < ApplicationController
  before_action :set_journalpayment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authorize_user


  # GET /journalpayments
  # GET /journalpayments.json
  def index
    @journalpayments = Journalpayment.all
    @journals = @journalpayments.find_by_user_id(current_user.id)
    if @journals.nil? 
      redirect_to new_journalpayment_path
      return
    end
  end

  # GET /journalpayments/1
  # GET /journalpayments/1.json
  def show
  end

  # GET /journalpayments/new
  def new
    @journalpayment = Journalpayment.new
  end

  # GET /journalpayments/1/edit
  def edit
  end

  # POST /journalpayments
  # POST /journalpayments.json
  def create
    @journalpayment = Journalpayment.new(journalpayment_params)
    @journalpayment.save
    @journalpayment.user_id = current_user.id
    @journalpayment.save


    respond_to do |format|
      if @journalpayment.save
        if @journalpayment.journal.include? "Scopus"
          @journalpayment.update_attributes(:amount => 5000)
          @journalpayment.save
        elsif @journalpayment.journal.include? "Annexure-II"
          @journalpayment.update_attributes(:amount => 10000)
          @journalpayment.save
        elsif @journalpayment.journal.include? "Google"
          @journalpayment.update_attributes(:amount => 1200)
          @journalpayment.save
        end
        format.html { redirect_to journalpayments_path, notice: 'Journal was successfully created.' }
        format.json { render :show, status: :created, location: journalpayments_path }
      else
        format.html { render :new }
        format.json { render json: @journalpayment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /journalpayments/1
  # PATCH/PUT /journalpayments/1.json
  def update
    respond_to do |format|
      if @journalpayment.update(journalpayment_params)
        format.html { redirect_to @journalpayment, notice: 'Journal was successfully updated.' }
        format.json { render :show, status: :ok, location: @journalpayment }
      else
        format.html { render :edit }
        format.json { render json: @journalpayment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journalpayments/1
  # DELETE /journalpayments/1.json
  def destroy
    @journalpayment.destroy
    respond_to do |format|
      format.html { redirect_to journalpayments_url, notice: 'Journal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_journalpayment
      @journalpayment = Journalpayment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journalpayment_params
      params.require(:journalpayment).permit(:journal, :amount, :isPaid, :name, :ref_id, :paper)
    end
  end
