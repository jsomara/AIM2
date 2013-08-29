class ProjectsController < ApplicationController
  before_action :signed_in_user, only: [:create, :edit, :destroy]

  def index
    @projects = current_user.projects
  end

  def create
    @project = Project.new(project_params)
    ap "params: "
    ap project_params
    ap "project:"
    ap @project
    @project.user = current_user
    if @project.save
      flash[:success] = "Project created!"
      redirect_to projects_url
    else
      flash[:error] = @project.errors #not quite right
      render 'new'
    end
  end

  def edit
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def destroy
    @project.destroy
    redirect_to root_url
  end

  private

    def project_params
      params.require(:project).permit(:title, :sme, :audience, :behavior, :step)
    end

end
