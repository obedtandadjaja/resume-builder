class ExperiencesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_experience, only: [:show, :edit, :update, :destroy]

  # GET /experiences
  # GET /experiences.json
  def index
    @experiences = Experience.all
  end

  # GET /experiences/1
  # GET /experiences/1.json
  def show
  end

  # GET /experiences/new
  def new
    @experience = Experience.new
  end

  # GET /experiences/1/edit
  def edit
  end

  # POST /experiences
  # POST /experiences.json
  def create
    if params[:experience][:duty]["0"] != ""
      @experience = Experience.new(experience_params)
      if @experience.save
        params[:experience][:duty].each do |i, acc|
          ExperienceDuty.create(description: acc, experience_id: @experience.id)
        end
        redirect_to '/'
      else
        redirect_to :back, flash: {alert: @experience.errors.full_messages}
      end
    else
      redirect_to :back, flash: {alert: "Must have at least one duty"}
    end
  end

  # PATCH/PUT /experiences/1
  # PATCH/PUT /experiences/1.json
  def update
    @experience = Experience.find(params[:id])
    if params[:experience][:duty]["0"] != ""
      if @experience.update(experience_params)
        @experience.duty.delete_all
        params[:experience][:duty].each do |i, acc|
          ExperienceDuty.create(description: acc, experience_id: @experience.id)
        end
        redirect_to '/'
      else
        redirect_to :back, flash: {alert: @experience.errors.full_messages}
      end
    else
      redirect_to :back, flash: {alert: "Must have at least one duty"}
    end
  end

  # DELETE /experiences/1
  # DELETE /experiences/1.json
  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url, notice: 'Experience was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def experience_params
      params.require(:experience).permit(:company, :position, :location, :start_date, :end_date, :is_employed, :resume_id,
        :duty).merge(resume_id: current_user.resume.first.id)
    end
end
