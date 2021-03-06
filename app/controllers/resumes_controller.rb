class ResumesController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_resume, only: [:show, :edit, :update, :destroy]

  # GET /resumes
  # GET /resumes.json
  def index
    @current_user = current_user
    if !@current_user.resume.any?
      @resume = Resume.create(user_id: @current_user.id)
    else
      @resume = @current_user.resume.first
    end

    respond_to do |format|
        format.html
        format.pdf do
          render :pdf => 'file_name',
          :template => 'resumes/resume.pdf.erb',
          :layout => 'pdf.html.erb',
          :margin => {top: 0, bottom: 0, left: 0, right: 0}
        end
    end
  end

  # GET /resumes/1
  # GET /resumes/1.json
  def show
    respond_to do |format|
        format.html
        format.pdf do
          render :pdf => 'file_name',
          :template => 'resumes/resume.pdf.erb',
          :layout => 'pdf.html.erb',
          :margin => {top: 0, bottom: 0, left: 0, right: 0}
        end
    end
  end

  # GET /resumes/new
  def new
    @resume = Resume.new
  end

  # GET /resumes/1/edit
  def edit
  end

  # POST /resumes
  # POST /resumes.json
  def create
    @resume = Resume.new(resume_params)

    respond_to do |format|
      if @resume.save
        format.html { redirect_to @resume, notice: 'Resume was successfully created.' }
        format.json { render :show, status: :created, location: @resume }
      else
        format.html { render :new }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resumes/1
  # PATCH/PUT /resumes/1.json
  def update
    respond_to do |format|
      if @resume.update(resume_params)
        format.html { redirect_to @resume, notice: 'Resume was successfully updated.' }
        format.json { render :show, status: :ok, location: @resume }
      else
        format.html { render :edit }
        format.json { render json: @resume.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resumes/1
  # DELETE /resumes/1.json
  def destroy
    @resume.destroy
    respond_to do |format|
      format.html { redirect_to resumes_url, notice: 'Resume was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resume
      @resume = Resume.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resume_params
      params.require(:resume).permit(:objective, :user_id, :name)
    end
end
