class EducationsController < ApplicationController
  before_action :set_education, only: [:show, :edit, :update, :destroy]

  # GET /educations
  # GET /educations.json
  def index
    @educations = Education.all
  end

  # GET /educations/1
  # GET /educations/1.json
  def show
  end

  # GET /educations/new
  def new
    @education = Education.new
  end

  # GET /educations/1/edit
  def edit
  end

  # POST /educations
  # POST /educations.json
  def create
    if params[:education][:accomplishment]["0"] != ""
      @education = Education.new(education_params)
      if @education.save
        params[:education][:accomplishment].each do |i, acc|
          EducationAccomplishment.create(description: acc, education_id: @education.id)
        end
        redirect_to '/'
      else
        redirect_to :back, flash: {alert: @education.errors.full_messages}
      end
    else
      redirect_to :back, flash: {alert: "Must have at least one accomplishment"}
    end
  end

  # PATCH/PUT /educations/1
  # PATCH/PUT /educations/1.json
  def update
    @education = Education.find(params[:id])
    if params[:education][:accomplishment]["0"] != ""
      if @education.update(education_params)
        @education.education_accomplishment.delete_all
        params[:education][:accomplishment].each do |i, acc|
          EducationAccomplishment.create(description: acc, education_id: @education.id)
        end
        redirect_to '/'
      else
        redirect_to :back, flash: {alert: @education.errors.full_messages}
      end
    else
      redirect_to :back, flash: {alert: "Must have at least one accomplishment"}
    end
  end

  # DELETE /educations/1
  # DELETE /educations/1.json
  def destroy
    @education.destroy
    respond_to do |format|
      format.html { redirect_to educations_url, notice: 'Education was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education
      @education = Education.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def education_params
      params.require(:education).permit(:school_name, :school_location, :major, :minor, :degree, :gpa, :start_date,
        :end_date, :is_enrolled, :resume_id, :accomplishment).merge(resume_id: current_user.resume.first.id)
    end
end
