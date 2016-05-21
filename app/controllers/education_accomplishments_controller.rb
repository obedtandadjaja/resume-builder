class EducationAccomplishmentsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_education_accomplishment, only: [:show, :edit, :update, :destroy]

  # GET /education_accomplishments
  # GET /education_accomplishments.json
  def index
    @education_accomplishments = EducationAccomplishment.all
  end

  # GET /education_accomplishments/1
  # GET /education_accomplishments/1.json
  def show
  end

  # GET /education_accomplishments/new
  def new
    @education_accomplishment = EducationAccomplishment.new
  end

  # GET /education_accomplishments/1/edit
  def edit
  end

  # POST /education_accomplishments
  # POST /education_accomplishments.json
  def create
    @education_accomplishment = EducationAccomplishment.new(education_accomplishment_params)

    respond_to do |format|
      if @education_accomplishment.save
        format.html { redirect_to @education_accomplishment, notice: 'Education accomplishment was successfully created.' }
        format.json { render :show, status: :created, location: @education_accomplishment }
      else
        format.html { render :new }
        format.json { render json: @education_accomplishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /education_accomplishments/1
  # PATCH/PUT /education_accomplishments/1.json
  def update
    respond_to do |format|
      if @education_accomplishment.update(education_accomplishment_params)
        format.html { redirect_to @education_accomplishment, notice: 'Education accomplishment was successfully updated.' }
        format.json { render :show, status: :ok, location: @education_accomplishment }
      else
        format.html { render :edit }
        format.json { render json: @education_accomplishment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /education_accomplishments/1
  # DELETE /education_accomplishments/1.json
  def destroy
    @education_accomplishment.destroy
    respond_to do |format|
      format.html { redirect_to education_accomplishments_url, notice: 'Education accomplishment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education_accomplishment
      @education_accomplishment = EducationAccomplishment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def education_accomplishment_params
      params.require(:education_accomplishment).permit(:description, :education_id)
    end
end
