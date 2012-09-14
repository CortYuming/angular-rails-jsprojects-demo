class ProjectsController < ApplicationController
  layout nil
  before_filter :intercept_html_requests
  respond_to :json

  def index
    @projects = Project.all
    respond_with @projects
  end

  def show
    @project = Project.find(params[:id])
    respond_with @project
  end

  def create
    @project = Project.new(params[:project])
    @project.save
    respond_with @project
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes(params[:project])
    render :json => @project
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    render :json => {}
  end


  private
    def intercept_html_requests
    render 'layouts/application' if request.format == Mime::HTML
  end

end
