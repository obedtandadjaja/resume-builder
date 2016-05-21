class ExperienceDutiesController < ApplicationController
  before_action :set_experience_duty, only: [:show, :edit, :update, :destroy]

  # GET /experience_duties
  # GET /experience_duties.json
  def index
    @experience_duties = ExperienceDuty.all
  end

  # GET /experience_duties/1
  # GET /experience_duties/1.json
  def show
  end

  # GET /experience_duties/new
  def new
    @experience_duty = ExperienceDuty.new
  end

  # GET /experience_duties/1/edit
  def edit
  end

  # POST /experience_duties
  # POST /experience_duties.json
  def create
    @experience_duty = ExperienceDuty.new(experience_duty_params)

    respond_to do |format|
      if @experience_duty.save
        format.html { redirect_to @experience_duty, notice: 'Experience duty was successfully created.' }
        format.json { render :show, status: :created, location: @experience_duty }
      else
        format.html { render :new }
        format.json { render json: @experience_duty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experience_duties/1
  # PATCH/PUT /experience_duties/1.json
  def update
    respond_to do |format|
      if @experience_duty.update(experience_duty_params)
        format.html { redirect_to @experience_duty, notice: 'Experience duty was successfully updated.' }
        format.json { render :show, status: :ok, location: @experience_duty }
      else
        format.html { render :edit }
        format.json { render json: @experience_duty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experience_duties/1
  # DELETE /experience_duties/1.json
  def destroy
    @experience_duty.destroy
    respond_to do |format|
      format.html { redirect_to experience_duties_url, notice: 'Experience duty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience_duty
      @experience_duty = ExperienceDuty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_duty_params
      params.require(:experience_duty).permit(:description, :experience_id)
    end
end
