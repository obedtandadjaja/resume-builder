class AdditionalInfosController < ApplicationController
  before_filter :authenticate_user!

  # GET /additional_infos/new
  def new
    @additional_info = AdditionalInfo.new
  end

  # GET /additional_infos/1/edit
  def edit
    @additional_info = AdditionalInfo.new
    @resume = current_user.resume.first
  end

  # POST /additional_infos
  # POST /additional_infos.json
  def create
    @resume = current_user.resume.first
    resume_id = @resume.id
    @resume.additional_info.delete_all
    params[:additional_info].each do |i, info|
      if info != ""
        AdditionalInfo.create(description: info, resume_id: resume_id)
      end
    end
    @resume.skill.delete_all
    params[:skill].each do |i, skill|
      if skill != ""
        Skill.create(title: skill, resume_id: resume_id)
      end
    end
    redirect_to '/'
  end

  # PATCH/PUT /additional_infos/1
  # PATCH/PUT /additional_infos/1.json
  def update
    @resume = current_user.resume.first
    resume_id = @resume.id
    @resume.additional_info.delete_all
    params[:additional_info].each do |i, info|
      if info != ""
        AdditionalInfo.create(description: info, resume_id: resume_id)
      end
    end
    @resume.skill.delete_all
    params[:skill].each do |i, skill|
      if skill != ""
        Skill.create(title: skill, resume_id: resume_id)
      end
    end
    redirect_to '/'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def additional_info_params
      params.require(:additional_info).permit(:description, :resume_id)
    end
end
