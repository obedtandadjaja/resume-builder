class LinksController < ApplicationController
  before_filter :authenticate_user!

  # GET /links/new
  def new
    @current_user = current_user
    @resume = @current_user.resume.first
    @link = Link.new
  end

  # GET /links/edit
  def edit
    @resume = current_user.resume.first
    @link = Link.new
  end

  # POST /links
  # POST /links.json
  def create
    @resume = current_user.resume.first
    params[:link].each do |i, link|
      if link[:description] == "" || link[:url] == ""
        redirect_to :back, flash: {alert: "There is at least one link that does not have either a URL or a description"}
      end
    end
    @resume.link.delete_all
    params[:link].each do |i, link|
      Link.create(description: link[:description], url: link[:url], resume_id: @resume.id)
    end
    redirect_to '/'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:description, :url, :resume_id).merge(resume_id: current_user.resume.first.id)
    end
end
